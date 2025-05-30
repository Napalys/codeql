/**
 * @name Unreleased lock
 * @description A lock that is acquired one or more times without a matching number of unlocks
 *              may cause a deadlock.
 * @kind problem
 * @problem.severity error
 * @security-severity 5.0
 * @precision medium
 * @id java/unreleased-lock
 * @tags reliability
 *       security
 *       external/cwe/cwe-764
 *       external/cwe/cwe-833
 */

import java
import semmle.code.java.controlflow.Guards
import semmle.code.java.dataflow.SSA
import semmle.code.java.frameworks.Mockito

class LockType extends RefType {
  LockType() {
    this.getAMethod().hasName("lock") and
    this.getAMethod().hasName("unlock")
  }

  Method getLockMethod() {
    result.getDeclaringType() = this and
    (result.hasName("lock") or result.hasName("tryLock"))
  }

  Method getUnlockMethod() {
    result.getDeclaringType() = this and
    result.hasName("unlock")
  }

  Method getIsHeldByCurrentThreadMethod() {
    result.getDeclaringType() = this and
    result.hasName("isHeldByCurrentThread")
  }

  MethodCall getLockAccess() {
    result.getMethod() = this.getLockMethod() and
    // Not part of a Mockito verification call
    not result instanceof MockitoVerifiedMethodCall
  }

  MethodCall getUnlockAccess() {
    result.getMethod() = this.getUnlockMethod() and
    // Not part of a Mockito verification call
    not result instanceof MockitoVerifiedMethodCall
  }

  MethodCall getIsHeldByCurrentThreadAccess() {
    result.getMethod() = this.getIsHeldByCurrentThreadMethod() and
    // Not part of a Mockito verification call
    not result instanceof MockitoVerifiedMethodCall
  }
}

predicate lockBlock(LockType t, BasicBlock b, int locks) {
  locks = strictcount(int i | b.getNode(i).asExpr() = t.getLockAccess())
}

predicate unlockBlock(LockType t, BasicBlock b, int unlocks) {
  unlocks = strictcount(int i | b.getNode(i).asExpr() = t.getUnlockAccess())
}

/**
 * A block `b` that locks and/or unlocks `t` a number of times; `netlocks`
 * equals the number of locks minus the number of unlocks.
 */
predicate lockUnlockBlock(LockType t, BasicBlock b, int netlocks) {
  lockBlock(t, b, netlocks) and not unlockBlock(t, b, _)
  or
  exists(int unlocks |
    not lockBlock(t, b, _) and unlockBlock(t, b, unlocks) and netlocks = -unlocks
  )
  or
  exists(int locks, int unlocks |
    lockBlock(t, b, locks) and unlockBlock(t, b, unlocks) and netlocks = locks - unlocks
  )
}

/**
 * A call to `lock` or `tryLock` on `t` that fails with an exception or the value `false`
 * resulting in a CFG edge from `lockblock` to `exblock`.
 */
predicate failedLock(LockType t, BasicBlock lockblock, BasicBlock exblock) {
  exists(ControlFlowNode lock |
    lock = lockblock.getLastNode() and
    (
      lock.asExpr() = t.getLockAccess()
      or
      exists(SsaExplicitUpdate lockbool |
        // Using the value of `t.getLockAccess()` ensures that it is a `tryLock` call.
        lock.asExpr() = lockbool.getAUse() and
        lockbool.getDefiningExpr().(VariableAssign).getSource() = t.getLockAccess()
      )
    ) and
    (
      lock.getAnExceptionSuccessor() = exblock.getFirstNode() or
      lock.(ConditionNode).getAFalseSuccessor() = exblock.getFirstNode()
    )
  )
}

/**
 * A call to `isHeldByCurrentThread` on `t` in `checkblock` that has `falsesucc` as the false
 * successor.
 */
predicate heldByCurrentThreadCheck(LockType t, BasicBlock checkblock, BasicBlock falsesucc) {
  exists(ConditionBlock conditionBlock |
    conditionBlock.getCondition() = t.getIsHeldByCurrentThreadAccess()
  |
    conditionBlock = checkblock and
    conditionBlock.getTestSuccessor(false) = falsesucc
  )
}

/**
 * Holds if there is a variable access in `checkblock` that has `falsesucc` as the false successor.
 *
 * The variable access must have an assigned value that is a lock access on `t`, and
 * the true successor of `checkblock` must contain an unlock access.
 */
predicate variableLockStateCheck(LockType t, BasicBlock checkblock, BasicBlock falsesucc) {
  exists(ConditionBlock conditionBlock, VarAccess v |
    v.getType() instanceof BooleanType and
    // Ensure that a lock access is assigned to the variable
    v.getVariable().getAnAssignedValue() = t.getLockAccess() and
    // Ensure that the `true` successor of the condition block contains an unlock access
    conditionBlock.getTestSuccessor(true) = t.getUnlockAccess().getBasicBlock() and
    conditionBlock.getCondition() = v
  |
    conditionBlock = checkblock and
    conditionBlock.getTestSuccessor(false) = falsesucc
  )
}

/**
 * A control flow path from a locking call in `src` to `b` such that the number of
 * locks minus the number of unlocks along the way is positive and equal to `locks`.
 */
predicate blockIsLocked(LockType t, BasicBlock src, BasicBlock b, int locks) {
  lockUnlockBlock(t, b, locks) and src = b and locks > 0
  or
  exists(BasicBlock pred, int predlocks, int curlocks, int failedlock | pred = b.getAPredecessor() |
    // The number of net locks from the `src` block to the predecessor block `pred` is `predlocks`.
    blockIsLocked(t, src, pred, predlocks) and
    // The recursive call ensures that at least one lock is held, so do not consider the false
    // successor of the `isHeldByCurrentThread()` check or of `variableLockStateCheck`.
    not heldByCurrentThreadCheck(t, pred, b) and
    not variableLockStateCheck(t, pred, b) and
    // Count a failed lock as an unlock so the net is zero.
    (if failedLock(t, pred, b) then failedlock = 1 else failedlock = 0) and
    (
      not lockUnlockBlock(t, b, _) and curlocks = 0
      or
      lockUnlockBlock(t, b, curlocks)
    ) and
    locks = predlocks + curlocks - failedlock and
    locks > 0 and
    // Arbitrary bound in order to fail gracefully in case of locking in a loop.
    locks < 10
  )
}

from Callable c, LockType t, BasicBlock src, ExitBlock exit, MethodCall lock
where
  // Restrict results to those methods that actually attempt to unlock.
  t.getUnlockAccess().getEnclosingCallable() = c and
  blockIsLocked(t, src, exit, _) and
  exit.getEnclosingCallable() = c and
  lock = src.getANode().asExpr() and
  lock = t.getLockAccess()
select lock, "This lock might not be unlocked or might be locked more times than it is unlocked."
