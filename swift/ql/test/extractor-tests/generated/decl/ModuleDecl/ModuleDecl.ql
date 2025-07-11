// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

query predicate instances(
  ModuleDecl x, string getModule__label, ModuleDecl getModule, string getInterfaceType__label,
  Type getInterfaceType, string getName__label, string getName, string isBuiltinModule__label,
  string isBuiltinModule, string isSystemModule__label, string isSystemModule
) {
  toBeTested(x) and
  not x.isUnknown() and
  getModule__label = "getModule:" and
  getModule = x.getModule() and
  getInterfaceType__label = "getInterfaceType:" and
  getInterfaceType = x.getInterfaceType() and
  getName__label = "getName:" and
  getName = x.getName() and
  isBuiltinModule__label = "isBuiltinModule:" and
  (if x.isBuiltinModule() then isBuiltinModule = "yes" else isBuiltinModule = "no") and
  isSystemModule__label = "isSystemModule:" and
  if x.isSystemModule() then isSystemModule = "yes" else isSystemModule = "no"
}

query predicate getMember(ModuleDecl x, int index, Decl getMember) {
  toBeTested(x) and not x.isUnknown() and getMember = x.getMember(index)
}

query predicate getInheritedType(ModuleDecl x, int index, Type getInheritedType) {
  toBeTested(x) and not x.isUnknown() and getInheritedType = x.getInheritedType(index)
}

query predicate getAnImportedModule(ModuleDecl x, ModuleDecl getAnImportedModule) {
  toBeTested(x) and not x.isUnknown() and getAnImportedModule = x.getAnImportedModule()
}

query predicate getAnExportedModule(ModuleDecl x, ModuleDecl getAnExportedModule) {
  toBeTested(x) and not x.isUnknown() and getAnExportedModule = x.getAnExportedModule()
}
