/**
 * Provides classes and predicates for working with the Apache Thrift framework.
 */
overlay[local?]
module;

import java

/**
 * A file detected as generated by the Apache Thrift Compiler.
 */
class ThriftGeneratedFile extends GeneratedFile {
  cached
  ThriftGeneratedFile() {
    exists(JavadocElement t | t.getFile() = this |
      exists(string msg | msg = t.getText() | msg.regexpMatch("(?i).*\\bAutogenerated by Thrift.*"))
    )
  }
}

/**
 * A Thrift `Iface` interface in a class generated by the Apache Thrift Compiler.
 */
class ThriftIface extends Interface {
  ThriftIface() {
    this.hasName("Iface") and
    this.getEnclosingType() instanceof TopLevelType and
    this.getFile() instanceof ThriftGeneratedFile
  }

  /** Gets an implementation of a method of this interface. */
  Method getAnImplementingMethod() {
    result.getDeclaringType().(Class).getAStrictAncestor() = this and
    result.overrides+(this.getAMethod()) and
    not result.getFile() = this.getFile()
  }
}
