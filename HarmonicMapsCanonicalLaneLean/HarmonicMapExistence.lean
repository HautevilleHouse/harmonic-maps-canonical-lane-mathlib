import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapExistencePackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  targetNonpositiveCurvature : Prop
  energyBound : Prop
  flowConverges : Prop
  limitHarmonic : Prop

structure HarmonicMapExistenceEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : HarmonicMapExistencePackage M N) where
  targetNonpositiveCurvatureClosed : E.targetNonpositiveCurvature
  energyBoundClosed : E.energyBound
  flowConvergesClosed : E.flowConverges
  limitHarmonicClosed : E.limitHarmonic

def HarmonicMapExistenceClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : HarmonicMapExistencePackage M N) : Prop :=
  E.targetNonpositiveCurvature ∧ E.energyBound ∧ E.flowConverges ∧ E.limitHarmonic

theorem harmonic_map_existence_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : HarmonicMapExistencePackage M N) (Ev : HarmonicMapExistenceEvidence E) :
    HarmonicMapExistenceClosed E := by
  exact And.intro Ev.targetNonpositiveCurvatureClosed
    (And.intro Ev.energyBoundClosed
      (And.intro Ev.flowConvergesClosed Ev.limitHarmonicClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse