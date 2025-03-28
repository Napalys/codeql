private import codeql.swift.generated.expr.DeclRefExpr
private import codeql.swift.elements.decl.CapturedDecl

module Impl {
  /**
   * An expression that references or accesses a declaration.
   */
  class DeclRefExpr extends Generated::DeclRefExpr {
    override string toStringImpl() {
      if exists(this.getDecl().toStringImpl())
      then result = this.getDecl().toStringImpl()
      else result = "(unknown declaration)"
    }

    /**
     * Gets the closure capture referenced by this expression, if any.
     */
    CapturedDecl getCapturedDecl() { result.getAnAccess() = this }

    /**
     * Holds if this expression references a closure capture.
     */
    predicate hasCapturedDecl() { exists(this.getCapturedDecl()) }
  }
}
