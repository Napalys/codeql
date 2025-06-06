// generated by codegen, do not edit
/**
 * This module provides the generated definition of `Crate`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.LocatableImpl::Impl as LocatableImpl
import codeql.rust.elements.internal.NamedCrate

/**
 * INTERNAL: This module contains the fully generated definition of `Crate` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::Crate` class directly.
   * Use the subclass `Crate`, where the following predicates are available.
   */
  class Crate extends Synth::TCrate, LocatableImpl::Locatable {
    override string getAPrimaryQlClass() { result = "Crate" }

    /**
     * Gets the name of this crate, if it exists.
     */
    string getName() { result = Synth::convertCrateToRaw(this).(Raw::Crate).getName() }

    /**
     * Holds if `getName()` exists.
     */
    final predicate hasName() { exists(this.getName()) }

    /**
     * Gets the version of this crate, if it exists.
     */
    string getVersion() { result = Synth::convertCrateToRaw(this).(Raw::Crate).getVersion() }

    /**
     * Holds if `getVersion()` exists.
     */
    final predicate hasVersion() { exists(this.getVersion()) }

    /**
     * Gets the `index`th cfg option of this crate (0-based).
     */
    string getCfgOption(int index) {
      result = Synth::convertCrateToRaw(this).(Raw::Crate).getCfgOption(index)
    }

    /**
     * Gets any of the cfg options of this crate.
     */
    final string getACfgOption() { result = this.getCfgOption(_) }

    /**
     * Gets the number of cfg options of this crate.
     */
    final int getNumberOfCfgOptions() { result = count(int i | exists(this.getCfgOption(i))) }

    /**
     * Gets the `index`th named dependency of this crate (0-based).
     *
     * INTERNAL: Do not use.
     */
    NamedCrate getNamedDependency(int index) {
      result =
        Synth::convertNamedCrateFromRaw(Synth::convertCrateToRaw(this)
              .(Raw::Crate)
              .getNamedDependency(index))
    }

    /**
     * Gets any of the named dependencies of this crate.
     * INTERNAL: Do not use.
     */
    final NamedCrate getANamedDependency() { result = this.getNamedDependency(_) }

    /**
     * Gets the number of named dependencies of this crate.
     * INTERNAL: Do not use.
     */
    final int getNumberOfNamedDependencies() {
      result = count(int i | exists(this.getNamedDependency(i)))
    }
  }
}
