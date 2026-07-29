import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure BochnerFormulaPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  energyDensity : Type
  hessian : Type
  bochnerIdentity : Prop
  laplacianEnergy : Prop

structure BochnerFormulaEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (B : BochnerFormulaPackage M N) where
  bochnerIdentityClosed : B.bochnerIdentity
  laplacianEnergyClosed : B.laplacianEnergy

def BochnerFormulaClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (B : BochnerFormulaPackage M N) : Prop :=
  B.bochnerIdentity ∧ B.laplacianEnergy

theorem bochner_formula_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (B : BochnerFormulaPackage M N) (E : BochnerFormulaEvidence B) : BochnerFormulaClosed B := by
  exact And.intro E.bochnerIdentityClosed E.laplacianEnergyClosed

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
