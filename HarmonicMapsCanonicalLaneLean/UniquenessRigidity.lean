import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure UniquenessPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  uniquenessUnderBoundary : Prop
  rigidityForTargetNegativeCurvature : Prop
  constantMapCharacterization : Prop

structure UniquenessEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (U : UniquenessPackage M N) where
  uniquenessUnderBoundaryClosed : U.uniquenessUnderBoundary
  rigidityForTargetNegativeCurvatureClosed : U.rigidityForTargetNegativeCurvature
  constantMapCharacterizationClosed : U.constantMapCharacterization

def UniquenessClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (U : UniquenessPackage M N) : Prop :=
  U.uniquenessUnderBoundary ∧ U.rigidityForTargetNegativeCurvature ∧ U.constantMapCharacterization

theorem uniqueness_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (U : UniquenessPackage M N) (E : UniquenessEvidence U) : UniquenessClosed U := by
  exact And.intro E.uniquenessUnderBoundaryClosed (And.intro E.rigidityForTargetNegativeCurvatureClosed E.constantMapCharacterizationClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
