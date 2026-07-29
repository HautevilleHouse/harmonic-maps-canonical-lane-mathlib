import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  map : M → N
  energyFunctional : Type
  eulerLagrangeEquation : Prop
  tensionField : Prop
  weaklyHarmonic : Prop

structure HarmonicMapEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (H : HarmonicMapPackage M N) where
  eulerLagrangeEquationClosed : H.eulerLagrangeEquation
  tensionFieldClosed : H.tensionField
  weaklyHarmonicClosed : H.weaklyHarmonic

def HarmonicMapClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (H : HarmonicMapPackage M N) : Prop :=
  H.eulerLagrangeEquation ∧ H.tensionField ∧ H.weaklyHarmonic

theorem harmonic_map_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (H : HarmonicMapPackage M N) (E : HarmonicMapEvidence H) : HarmonicMapClosed H := by
  exact And.intro E.eulerLagrangeEquationClosed (And.intro E.tensionFieldClosed E.weaklyHarmonicClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
