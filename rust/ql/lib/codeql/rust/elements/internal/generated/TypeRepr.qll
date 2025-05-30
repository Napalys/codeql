// generated by codegen, do not edit
/**
 * This module provides the generated definition of `TypeRepr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `TypeRepr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * The base class for type references.
   * ```rust
   * let x: i32;
   * let y: Vec<i32>;
   * let z: Option<i32>;
   * ```
   * INTERNAL: Do not reference the `Generated::TypeRepr` class directly.
   * Use the subclass `TypeRepr`, where the following predicates are available.
   */
  class TypeRepr extends Synth::TTypeRepr, AstNodeImpl::AstNode { }
}
