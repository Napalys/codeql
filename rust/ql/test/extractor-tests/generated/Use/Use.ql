// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Use x, string hasExtendedCanonicalPath, string hasCrateOrigin, int getNumberOfAttrs,
  string hasUseTree, string hasVisibility
where
  toBeTested(x) and
  not x.isUnknown() and
  (
    if x.hasExtendedCanonicalPath()
    then hasExtendedCanonicalPath = "yes"
    else hasExtendedCanonicalPath = "no"
  ) and
  (if x.hasCrateOrigin() then hasCrateOrigin = "yes" else hasCrateOrigin = "no") and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasUseTree() then hasUseTree = "yes" else hasUseTree = "no") and
  if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no"
select x, "hasExtendedCanonicalPath:", hasExtendedCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "getNumberOfAttrs:", getNumberOfAttrs, "hasUseTree:", hasUseTree, "hasVisibility:", hasVisibility
