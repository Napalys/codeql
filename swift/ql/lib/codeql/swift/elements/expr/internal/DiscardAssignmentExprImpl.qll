private import codeql.swift.generated.expr.DiscardAssignmentExpr

module Impl {
  class DiscardAssignmentExpr extends Generated::DiscardAssignmentExpr {
    override string toStringImpl() { result = "_" }
  }
}
