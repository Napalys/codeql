// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Trait x, string hasExtendedCanonicalPath, string hasCrateOrigin,
  string hasAttributeMacroExpansion, string hasAssocItemList, int getNumberOfAttrs,
  string hasGenericParamList, string isAuto, string isUnsafe, string hasName,
  string hasTypeBoundList, string hasVisibility, string hasWhereClause
where
  toBeTested(x) and
  not x.isUnknown() and
  (
    if x.hasExtendedCanonicalPath()
    then hasExtendedCanonicalPath = "yes"
    else hasExtendedCanonicalPath = "no"
  ) and
  (if x.hasCrateOrigin() then hasCrateOrigin = "yes" else hasCrateOrigin = "no") and
  (
    if x.hasAttributeMacroExpansion()
    then hasAttributeMacroExpansion = "yes"
    else hasAttributeMacroExpansion = "no"
  ) and
  (if x.hasAssocItemList() then hasAssocItemList = "yes" else hasAssocItemList = "no") and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasGenericParamList() then hasGenericParamList = "yes" else hasGenericParamList = "no") and
  (if x.isAuto() then isAuto = "yes" else isAuto = "no") and
  (if x.isUnsafe() then isUnsafe = "yes" else isUnsafe = "no") and
  (if x.hasName() then hasName = "yes" else hasName = "no") and
  (if x.hasTypeBoundList() then hasTypeBoundList = "yes" else hasTypeBoundList = "no") and
  (if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no") and
  if x.hasWhereClause() then hasWhereClause = "yes" else hasWhereClause = "no"
select x, "hasExtendedCanonicalPath:", hasExtendedCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "hasAttributeMacroExpansion:", hasAttributeMacroExpansion, "hasAssocItemList:", hasAssocItemList,
  "getNumberOfAttrs:", getNumberOfAttrs, "hasGenericParamList:", hasGenericParamList, "isAuto:",
  isAuto, "isUnsafe:", isUnsafe, "hasName:", hasName, "hasTypeBoundList:", hasTypeBoundList,
  "hasVisibility:", hasVisibility, "hasWhereClause:", hasWhereClause
