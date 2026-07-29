import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapTargetManifold where
  targetSpace : Type u
  targetMetric : Type v
  riemannianTarget : Prop
  nonpositiveSectionalCurvature : Prop
  contractibleTarget : Prop
  riemannianTargetTerm : riemannianTarget
  nonpositiveSectionalCurvatureTerm : nonpositiveSectionalCurvature
  contractibleTargetTerm : contractibleTarget

structure HarmonicMapTargetEvidence (M : HarmonicMapTargetManifold) where
  riemannianTargetClosed : M.riemannianTarget
  nonpositiveSectionalCurvatureClosed : M.nonpositiveSectionalCurvature
  contractibleTargetClosed : M.contractibleTarget

def HarmonicMapTargetClosed (M : HarmonicMapTargetManifold) : Prop :=
  M.riemannianTarget ∧ M.nonpositiveSectionalCurvature ∧ M.contractibleTarget

theorem harmonic_map_target_closed_from_evidence (M : HarmonicMapTargetManifold)
    (E : HarmonicMapTargetEvidence M) : HarmonicMapTargetClosed M := by
  exact And.intro E.riemannianTargetClosed
    (And.intro E.nonpositiveSectionalCurvatureClosed E.contractibleTargetClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse