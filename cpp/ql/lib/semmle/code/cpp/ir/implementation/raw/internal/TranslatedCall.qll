private import cpp
private import semmle.code.cpp.ir.implementation.Opcode
private import semmle.code.cpp.ir.implementation.internal.OperandTag
private import semmle.code.cpp.ir.internal.CppType
private import semmle.code.cpp.models.interfaces.SideEffect
private import semmle.code.cpp.models.interfaces.Throwing
private import semmle.code.cpp.models.interfaces.NonThrowing
private import InstructionTag
private import SideEffects
private import TranslatedElement
private import TranslatedExpr
private import TranslatedFunction
private import DefaultOptions as DefaultOptions

/**
 * Gets the `CallInstruction` from the `TranslatedCallExpr` for the specified expression.
 */
private CallInstruction getTranslatedCallInstruction(Call call) {
  exists(TranslatedCallExpr translatedCall |
    translatedCall.getExpr() = call and
    result = translatedCall.getInstruction(CallTag())
  )
}

/**
 * The IR translation of a call to a function. The call may be from an actual
 * call in the source code, or could be a call that is part of the translation
 * of a higher-level constructor (e.g. the allocator call in a `NewExpr`).
 */
abstract class TranslatedCall extends TranslatedExpr {
  final override TranslatedElement getChildInternal(int id) {
    // We choose the child's id in the order of evaluation.
    // The qualifier is evaluated before the call target, because the value of
    // the call target may depend on the value of the qualifier for virtual
    // calls.
    id = -2 and result = this.getQualifier()
    or
    id = -1 and result = this.getCallTarget()
    or
    result = this.getArgument(id)
    or
    id = this.getNumberOfArguments() and result = this.getSideEffects()
  }

  final override Instruction getFirstInstruction(EdgeKind kind) {
    if exists(this.getQualifier())
    then result = this.getQualifier().getFirstInstruction(kind)
    else result = this.getFirstCallTargetInstruction(kind)
  }

  override Instruction getALastInstructionInternal() {
    result = this.getSideEffects().getALastInstruction()
  }

  override TranslatedElement getLastChild() { result = this.getSideEffects() }

  override predicate hasInstruction(Opcode opcode, InstructionTag tag, CppType resultType) {
    tag = CallTag() and
    opcode instanceof Opcode::Call and
    resultType = getTypeForPRValue(this.getCallResultType())
  }

  override Instruction getChildSuccessorInternal(TranslatedElement child, EdgeKind kind) {
    child = this.getQualifier() and
    result = this.getFirstCallTargetInstruction(kind)
    or
    child = this.getCallTarget() and
    result = this.getFirstArgumentOrCallInstruction(kind)
    or
    exists(int argIndex |
      child = this.getArgument(argIndex) and
      if exists(this.getArgument(argIndex + 1))
      then result = this.getArgument(argIndex + 1).getFirstInstruction(kind)
      else (
        result = this.getInstruction(CallTag()) and kind instanceof GotoEdge
      )
    )
    or
    child = this.getSideEffects() and
    if this.isNoReturn()
    then
      kind instanceof GotoEdge and
      result =
        any(UnreachedInstruction instr |
          this.getEnclosingFunction().getFunction() = instr.getEnclosingFunction()
        )
    else (
      not this.mustThrowException(_) and
      result = this.getParent().getChildSuccessor(this, kind)
      or
      this.mayThrowException(kind) and
      result = this.getParent().getExceptionSuccessorInstruction(any(GotoEdge edge))
    )
  }

  override Instruction getInstructionSuccessorInternal(InstructionTag tag, EdgeKind kind) {
    tag = CallTag() and
    result = this.getSideEffects().getFirstInstruction(kind)
  }

  override Instruction getInstructionRegisterOperand(InstructionTag tag, OperandTag operandTag) {
    tag = CallTag() and
    (
      operandTag instanceof CallTargetOperandTag and
      result = this.getCallTargetResult()
      or
      operandTag instanceof ThisArgumentOperandTag and
      result = this.getQualifierResult()
      or
      exists(PositionalArgumentOperandTag argTag |
        argTag = operandTag and
        result = this.getArgument(argTag.getArgIndex()).getResult()
      )
    )
  }

  final override Instruction getResult() { result = this.getInstruction(CallTag()) }

  /**
   * Holds if the evaluation of this call may throw an exception of the kind represented by the `ExceptionEdge`.
   */
  abstract predicate mayThrowException(ExceptionEdge e);

  /**
   * Holds if the evaluation of this call always throws an exception of the kind represented by the `ExceptionEdge`.
   */
  abstract predicate mustThrowException(ExceptionEdge e);

  /**
   * Gets the result type of the call.
   */
  abstract Type getCallResultType();

  /**
   * Holds if the call has a `this` argument.
   */
  predicate hasQualifier() { exists(this.getQualifier()) }

  /**
   * Gets the `TranslatedExpr` for the indirect target of the call, if any.
   */
  TranslatedExpr getCallTarget() { none() }

  /**
   * Gets the first instruction of the sequence to evaluate the call target.
   * By default, this is just the first instruction of `getCallTarget()`, but
   * it can be overridden by a subclass for cases where there is a call target
   * that is not computed from an expression (e.g. a direct call).
   */
  Instruction getFirstCallTargetInstruction(EdgeKind kind) {
    result = this.getCallTarget().getFirstInstruction(kind)
  }

  /**
   * Gets the instruction whose result value is the target of the call. By
   * default, this is just the result of `getCallTarget()`, but it can be
   * overridden by a subclass for cases where there is a call target that is not
   * computed from an expression (e.g. a direct call).
   */
  Instruction getCallTargetResult() { result = this.getCallTarget().getResult() }

  /**
   * Gets the `TranslatedExpr` for the qualifier of the call (i.e. the value
   * that is passed as the `this` argument.
   */
  abstract TranslatedExpr getQualifier();

  /**
   * Gets the instruction whose result value is the `this` argument of the call.
   * By default, this is just the result of `getQualifier()`, but it can be
   * overridden by a subclass for cases where there is a `this` argument that is
   * not computed from a child expression (e.g. a constructor call).
   */
  Instruction getQualifierResult() { result = this.getQualifier().getResult() }

  /**
   * Gets the argument with the specified `index`. Does not include the `this`
   * argument.
   */
  abstract TranslatedExpr getArgument(int index);

  abstract int getNumberOfArguments();

  /**
   * If there are any arguments, gets the first instruction of the first
   * argument. Otherwise, returns the call instruction.
   */
  final Instruction getFirstArgumentOrCallInstruction(EdgeKind kind) {
    if this.hasArguments()
    then result = this.getArgument(0).getFirstInstruction(kind)
    else (
      kind instanceof GotoEdge and result = this.getInstruction(CallTag())
    )
  }

  /**
   * Holds if the call has any arguments, not counting the `this` argument.
   */
  abstract predicate hasArguments();

  predicate isNoReturn() { none() }

  final TranslatedSideEffects getSideEffects() { result.getExpr() = expr }
}

/**
 * The IR translation of the side effects of the parent `TranslatedElement`.
 *
 * This object does not itself generate the side effect instructions. Instead, its children provide
 * the actual side effects, with this object acting as a placeholder so the parent only needs to
 * insert this one element at the point where all the side effects are supposed to occur.
 */
abstract class TranslatedSideEffects extends TranslatedElement {
  /** Gets the expression whose side effects are being modeled. */
  abstract Expr getExpr();

  final override Locatable getAst() { result = this.getExpr() }

  final override Declaration getFunction() { result = getEnclosingDeclaration(this.getExpr()) }

  final override TranslatedElement getChild(int i) {
    result =
      rank[i + 1](TranslatedSideEffect tse, int group, int indexInGroup |
        tse.getPrimaryExpr() = this.getExpr() and
        tse.sortOrder(group, indexInGroup)
      |
        tse order by group, indexInGroup
      )
  }

  final override Instruction getChildSuccessorInternal(TranslatedElement te, EdgeKind kind) {
    exists(int i |
      this.getChild(i) = te and
      if exists(this.getChild(i + 1))
      then result = this.getChild(i + 1).getFirstInstruction(kind)
      else result = this.getParent().getChildSuccessor(this, kind)
    )
  }

  override TranslatedElement getLastChild() {
    result = this.getChild(max(int i | exists(this.getChild(i))))
  }

  final override predicate hasInstruction(Opcode opcode, InstructionTag tag, CppType type) {
    none()
  }

  final override Instruction getFirstInstruction(EdgeKind kind) {
    result = this.getChild(0).getFirstInstruction(kind)
    or
    // Some functions, like `std::move()`, have no side effects whatsoever.
    not exists(this.getChild(0)) and
    result = this.getParent().getChildSuccessor(this, kind)
  }

  override Instruction getALastInstructionInternal() {
    if exists(this.getAChild())
    then result = this.getChild(max(int i | exists(this.getChild(i)))).getALastInstruction()
    else
      // If there are no side effects, the "last" instruction should be the parent call's last
      // instruction, so that implicit destructors can be inserted in the right place.
      result = this.getParent().getInstruction(CallTag())
  }

  final override Instruction getInstructionSuccessorInternal(InstructionTag tag, EdgeKind kind) {
    none()
  }

  /** Gets the primary instruction to be associated with each side effect instruction. */
  abstract Instruction getPrimaryInstruction();
}

/**
 * IR translation of a direct call to a specific function. Used for both
 * explicit calls (`TranslatedFunctionCall`) and implicit calls
 * (`TranslatedAllocatorCall`).
 */
abstract class TranslatedDirectCall extends TranslatedCall {
  final override Instruction getFirstCallTargetInstruction(EdgeKind kind) {
    result = this.getInstruction(CallTargetTag()) and
    kind instanceof GotoEdge
  }

  final override Instruction getCallTargetResult() { result = this.getInstruction(CallTargetTag()) }

  override predicate hasInstruction(Opcode opcode, InstructionTag tag, CppType resultType) {
    TranslatedCall.super.hasInstruction(opcode, tag, resultType)
    or
    tag = CallTargetTag() and
    opcode instanceof Opcode::FunctionAddress and
    resultType = getFunctionGLValueType()
  }

  override Instruction getInstructionSuccessorInternal(InstructionTag tag, EdgeKind kind) {
    result = TranslatedCall.super.getInstructionSuccessorInternal(tag, kind)
    or
    tag = CallTargetTag() and
    result = this.getFirstArgumentOrCallInstruction(kind)
  }
}

/**
 * The IR translation of a call to a function.
 */
abstract class TranslatedCallExpr extends TranslatedNonConstantExpr, TranslatedCall {
  override Call expr;

  final override Type getCallResultType() { result = expr.getType() }

  final override predicate hasArguments() { exists(expr.getArgument(0)) }

  final override TranslatedExpr getQualifier() {
    result = getTranslatedExpr(expr.getQualifier().getFullyConverted())
  }

  final override TranslatedExpr getArgument(int index) {
    result = getTranslatedExpr(expr.getArgument(index).getFullyConverted())
  }

  final override int getNumberOfArguments() { result = expr.getNumberOfArguments() }

  final override predicate isNoReturn() { any(Options opt).exits(expr.getTarget()) }
}

/**
 * Represents the IR translation of a call through a function pointer.
 */
class TranslatedExprCall extends TranslatedCallExpr {
  override ExprCall expr;

  override TranslatedExpr getCallTarget() {
    result = getTranslatedExpr(expr.getExpr().getFullyConverted())
  }

  final override predicate mayThrowException(ExceptionEdge e) {
    // We assume that a call to a function pointer will not throw an exception.
    // This is not sound in general, but this will greatly reduce the number of
    // exceptional edges.
    none()
  }

  final override predicate mustThrowException(ExceptionEdge e) { none() }
}

/**
 * Represents the IR translation of a direct function call.
 */
class TranslatedFunctionCall extends TranslatedCallExpr, TranslatedDirectCall {
  override FunctionCall expr;

  override Function getInstructionFunction(InstructionTag tag) {
    tag = CallTargetTag() and result = expr.getTarget()
  }

  override Instruction getQualifierResult() {
    this.hasQualifier() and
    result = this.getQualifier().getResult()
  }

  override predicate hasQualifier() {
    exists(this.getQualifier()) and
    not exists(MemberFunction func | expr.getTarget() = func and func.isStatic())
  }

  final override predicate mayThrowException(ExceptionEdge e) {
    this.mustThrowException(e)
    or
    exists(MicrosoftTryStmt tryStmt | tryStmt.getStmt() = expr.getEnclosingStmt().getParent*()) and
    e instanceof SehExceptionEdge
    or
    not expr.getTarget() instanceof NonCppThrowingFunction and
    exists(TryStmt tryStmt | tryStmt.getStmt() = expr.getEnclosingStmt().getParent*()) and
    e instanceof CppExceptionEdge
  }

  final override predicate mustThrowException(ExceptionEdge e) {
    expr.getTarget() instanceof AlwaysSehThrowingFunction and
    e instanceof SehExceptionEdge
  }
}

/**
 * Represents the IR translation of a call to a constructor.
 */
class TranslatedStructorCall extends TranslatedFunctionCall {
  TranslatedStructorCall() {
    expr instanceof ConstructorCall or
    expr instanceof DestructorCall
  }

  override Instruction getQualifierResult() {
    exists(StructorCallContext context |
      context = this.getParent() and
      result = context.getReceiver()
    )
    or
    exists(Stmt parent |
      expr = parent.getAnImplicitDestructorCall() and
      result = getTranslatedExpr(expr.getQualifier().getFullyConverted()).getResult()
    )
    or
    exists(Expr parent |
      expr = parent.getAnImplicitDestructorCall() and
      result = getTranslatedExpr(expr.getQualifier().getFullyConverted()).getResult()
    )
  }

  override predicate hasQualifier() { any() }
}

/**
 * The IR translation of the side effects of a function call, including the implicit allocator
 * call in a `new` or `new[]` expression.
 */
class TranslatedCallSideEffects extends TranslatedSideEffects, TTranslatedCallSideEffects {
  Expr expr;

  TranslatedCallSideEffects() { this = TTranslatedCallSideEffects(expr) }

  final override string toString() { result = "(side effects  for " + expr.toString() + ")" }

  final override Expr getExpr() { result = expr }

  final override Instruction getPrimaryInstruction() {
    expr instanceof Call and result = getTranslatedCallInstruction(expr)
    or
    expr instanceof NewOrNewArrayExpr and
    result = getTranslatedAllocatorCall(expr).getInstruction(CallTag())
    or
    expr instanceof DeleteOrDeleteArrayExpr and
    result = getTranslatedDeleteOrDeleteArray(expr).getInstruction(CallTag())
  }
}

/** Returns the sort group index for argument read side effects. */
private int argumentReadGroup() { result = 1 }

/** Returns the sort group index for conservative call side effects. */
private int callSideEffectGroup() {
  result = 0 // Make this group first for now to preserve the existing ordering
}

/** Returns the sort group index for argument write side effects. */
private int argumentWriteGroup() { result = 2 }

/** Returns the sort group index for dynamic allocation side effects. */
private int initializeAllocationGroup() { result = 3 }

/**
 * The IR translation of a single side effect of a call.
 */
abstract class TranslatedSideEffect extends TranslatedElement {
  final override TranslatedElement getChild(int n) { none() }

  final override Instruction getChildSuccessorInternal(TranslatedElement child, EdgeKind kind) {
    none()
  }

  final override Instruction getFirstInstruction(EdgeKind kind) {
    result = this.getInstruction(OnlyInstructionTag()) and
    kind instanceof GotoEdge
  }

  override Instruction getALastInstructionInternal() {
    result = this.getInstruction(OnlyInstructionTag())
  }

  final override predicate hasInstruction(Opcode opcode, InstructionTag tag, CppType type) {
    tag = OnlyInstructionTag() and
    this.sideEffectInstruction(opcode, type)
  }

  final override Instruction getInstructionSuccessorInternal(InstructionTag tag, EdgeKind kind) {
    result = this.getParent().getChildSuccessor(this, kind) and
    tag = OnlyInstructionTag()
  }

  final override Declaration getFunction() { result = this.getParent().getFunction() }

  final override Instruction getPrimaryInstructionForSideEffect(InstructionTag tag) {
    tag = OnlyInstructionTag() and
    result = this.getParent().(TranslatedSideEffects).getPrimaryInstruction()
  }

  /**
   * Gets the expression that caused this side effect.
   *
   * All side effects with the same `getPrimaryExpr()` will appear in the same contiguous sequence
   * in the IR.
   */
  abstract Expr getPrimaryExpr();

  /**
   * Gets the order in which this side effect should be sorted with respect to other side effects
   * for the same expression.
   *
   * Side effects are sorted first by `group`, and then by `indexInGroup`.
   */
  abstract predicate sortOrder(int group, int indexInGroup);

  /**
   * Gets the opcode and result type for the side effect instruction.
   */
  abstract predicate sideEffectInstruction(Opcode opcode, CppType type);
}

/**
 * The IR translation of a single argument side effect for a call.
 */
abstract class TranslatedArgumentSideEffect extends TranslatedSideEffect {
  Call call;
  int index;
  SideEffectOpcode sideEffectOpcode;

  // All subclass charpreds must bind the `index` field.
  bindingset[index]
  TranslatedArgumentSideEffect() { any() }

  override string toString() {
    this.isWrite() and
    result = "(write side effect for " + this.getArgString() + ")"
    or
    not this.isWrite() and
    result = "(read side effect for " + this.getArgString() + ")"
  }

  override Call getPrimaryExpr() { result = call }

  override predicate sortOrder(int group, int indexInGroup) {
    indexInGroup = index and
    if this.isWrite() then group = argumentWriteGroup() else group = argumentReadGroup()
  }

  final override int getInstructionIndex(InstructionTag tag) {
    tag = OnlyInstructionTag() and
    result = index
  }

  final override predicate sideEffectInstruction(Opcode opcode, CppType type) {
    opcode = sideEffectOpcode and
    (
      this.isWrite() and
      (
        opcode instanceof BufferAccessOpcode and
        type = getUnknownType()
        or
        not opcode instanceof BufferAccessOpcode and
        exists(Type indirectionType | indirectionType = this.getIndirectionType() |
          if indirectionType instanceof VoidType
          then type = getUnknownType()
          else type = getTypeForPRValueOrUnknown(indirectionType)
        )
      )
      or
      not this.isWrite() and
      type = getVoidType()
    )
  }

  final override CppType getInstructionMemoryOperandType(
    InstructionTag tag, TypedOperandTag operandTag
  ) {
    not this.isWrite() and
    if sideEffectOpcode instanceof BufferAccessOpcode
    then
      result = getUnknownType() and
      tag instanceof OnlyInstructionTag and
      operandTag instanceof SideEffectOperandTag
    else
      exists(Type operandType |
        tag instanceof OnlyInstructionTag and
        operandType = this.getIndirectionType() and
        operandTag instanceof SideEffectOperandTag
      |
        // If the type we select is an incomplete type (e.g. a forward-declared `struct`), there will
        // not be a `CppType` that represents that type. In that case, fall back to `UnknownCppType`.
        result = getTypeForPRValueOrUnknown(operandType)
      )
  }

  final override Instruction getInstructionRegisterOperand(InstructionTag tag, OperandTag operandTag) {
    tag instanceof OnlyInstructionTag and
    operandTag instanceof AddressOperandTag and
    result = this.getArgInstruction()
    or
    tag instanceof OnlyInstructionTag and
    operandTag instanceof BufferSizeOperandTag and
    result =
      getTranslatedExpr(call.getArgument(call.getTarget()
              .(SideEffectFunction)
              .getParameterSizeIndex(index)).getFullyConverted()).getResult()
  }

  /** Holds if this side effect is a write side effect, rather than a read side effect. */
  final predicate isWrite() { sideEffectOpcode instanceof WriteSideEffectOpcode }

  /** Gets a text representation of the argument. */
  abstract string getArgString();

  /** Gets the `Instruction` whose result is the value of the argument. */
  abstract Instruction getArgInstruction();

  /** Gets the type pointed to by the argument. */
  abstract Type getIndirectionType();
}

/**
 * The IR translation of an argument side effect where the argument has an `Expr` object in the AST.
 *
 * This generally applies to all positional arguments, as well as qualifier (`this`) arguments for
 * calls other than constructor calls.
 */
class TranslatedArgumentExprSideEffect extends TranslatedArgumentSideEffect,
  TTranslatedArgumentExprSideEffect
{
  Expr arg;

  TranslatedArgumentExprSideEffect() {
    this = TTranslatedArgumentExprSideEffect(call, arg, index, sideEffectOpcode)
  }

  final override Locatable getAst() { result = arg }

  final override Type getIndirectionType() {
    result = arg.getUnspecifiedType().(DerivedType).getBaseType()
    or
    // Sometimes the qualifier type gets the type of the class itself, rather than a pointer to the
    // class.
    index = -1 and
    not arg.getUnspecifiedType() instanceof DerivedType and
    result = arg.getUnspecifiedType()
  }

  final override string getArgString() { result = arg.toString() }

  final override Instruction getArgInstruction() { result = getTranslatedExpr(arg).getResult() }
}

/**
 * The IR translation of an argument side effect for `*this` on a call, where there is no `Expr`
 * object that represents the `this` argument.
 *
 * The applies only to constructor calls, as the AST has exploit qualifier `Expr`s for all other
 * calls to non-static member functions.
 */
class TranslatedStructorQualifierSideEffect extends TranslatedArgumentSideEffect,
  TTranslatedStructorQualifierSideEffect
{
  TranslatedStructorQualifierSideEffect() {
    this = TTranslatedStructorQualifierSideEffect(call, sideEffectOpcode) and
    index = -1
  }

  final override Locatable getAst() { result = call }

  final override Type getIndirectionType() { result = call.getTarget().getDeclaringType() }

  final override string getArgString() { result = "this" }

  final override Instruction getArgInstruction() {
    exists(TranslatedStructorCall structorCall |
      structorCall.getExpr() = call and
      result = structorCall.getQualifierResult()
    )
  }
}

/** The IR translation of the non-argument-specific side effect of a call. */
class TranslatedCallSideEffect extends TranslatedSideEffect, TTranslatedCallSideEffect {
  Expr expr;
  SideEffectOpcode sideEffectOpcode;

  TranslatedCallSideEffect() { this = TTranslatedCallSideEffect(expr, sideEffectOpcode) }

  override Locatable getAst() { result = expr }

  override Expr getPrimaryExpr() { result = expr }

  override predicate sortOrder(int group, int indexInGroup) {
    group = callSideEffectGroup() and indexInGroup = 0
  }

  override string toString() { result = "(call side effect for '" + expr.toString() + "')" }

  override predicate sideEffectInstruction(Opcode opcode, CppType type) {
    opcode = sideEffectOpcode and
    (
      opcode instanceof Opcode::CallSideEffect and
      type = getUnknownType()
      or
      opcode instanceof Opcode::CallReadSideEffect and
      type = getVoidType()
    )
  }

  override CppType getInstructionMemoryOperandType(InstructionTag tag, TypedOperandTag operandTag) {
    tag instanceof OnlyInstructionTag and
    operandTag instanceof SideEffectOperandTag and
    result = getUnknownType()
  }
}

/**
 * The IR translation of the allocation side effect of a call to a memory allocation function.
 *
 * This side effect provides a definition for the newly-allocated memory.
 */
class TranslatedAllocationSideEffect extends TranslatedSideEffect, TTranslatedAllocationSideEffect {
  AllocationExpr expr;

  TranslatedAllocationSideEffect() { this = TTranslatedAllocationSideEffect(expr) }

  override Locatable getAst() { result = expr }

  override Expr getPrimaryExpr() { result = expr }

  override predicate sortOrder(int group, int indexInGroup) {
    group = initializeAllocationGroup() and indexInGroup = 0
  }

  override string toString() { result = "(allocation side effect for '" + expr.toString() + "')" }

  override Instruction getInstructionRegisterOperand(InstructionTag tag, OperandTag operandTag) {
    tag = OnlyInstructionTag() and
    operandTag = addressOperand() and
    result = this.getPrimaryInstructionForSideEffect(OnlyInstructionTag())
  }

  override predicate sideEffectInstruction(Opcode opcode, CppType type) {
    opcode instanceof Opcode::InitializeDynamicAllocation and
    type = getUnknownType()
  }
}
