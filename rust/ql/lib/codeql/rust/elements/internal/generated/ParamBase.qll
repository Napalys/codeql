// generated by codegen, do not edit
/**
 * This module provides the generated definition of `ParamBase`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl
import codeql.rust.elements.Attr
import codeql.rust.elements.TypeRepr

/**
 * INTERNAL: This module contains the fully generated definition of `ParamBase` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A normal parameter, `Param`, or a self parameter `SelfParam`.
   * INTERNAL: Do not reference the `Generated::ParamBase` class directly.
   * Use the subclass `ParamBase`, where the following predicates are available.
   */
  class ParamBase extends Synth::TParamBase, AstNodeImpl::AstNode {
    /**
     * Gets the `index`th attr of this parameter base (0-based).
     */
    Attr getAttr(int index) {
      result =
        Synth::convertAttrFromRaw(Synth::convertParamBaseToRaw(this).(Raw::ParamBase).getAttr(index))
    }

    /**
     * Gets any of the attrs of this parameter base.
     */
    final Attr getAnAttr() { result = this.getAttr(_) }

    /**
     * Gets the number of attrs of this parameter base.
     */
    final int getNumberOfAttrs() { result = count(int i | exists(this.getAttr(i))) }

    /**
     * Gets the type representation of this parameter base, if it exists.
     */
    TypeRepr getTypeRepr() {
      result =
        Synth::convertTypeReprFromRaw(Synth::convertParamBaseToRaw(this)
              .(Raw::ParamBase)
              .getTypeRepr())
    }

    /**
     * Holds if `getTypeRepr()` exists.
     */
    final predicate hasTypeRepr() { exists(this.getTypeRepr()) }
  }
}
