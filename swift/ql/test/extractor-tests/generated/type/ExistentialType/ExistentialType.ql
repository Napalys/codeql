// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

query predicate instances(
  ExistentialType x, string getName__label, string getName, string getCanonicalType__label,
  Type getCanonicalType, string getConstraint__label, Type getConstraint
) {
  toBeTested(x) and
  not x.isUnknown() and
  getName__label = "getName:" and
  getName = x.getName() and
  getCanonicalType__label = "getCanonicalType:" and
  getCanonicalType = x.getCanonicalType() and
  getConstraint__label = "getConstraint:" and
  getConstraint = x.getConstraint()
}
