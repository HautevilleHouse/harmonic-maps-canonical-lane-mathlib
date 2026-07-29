import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapFlowPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  gradientFlowEquation : Prop
  shortTimeExistence : Prop
  bochnerFormula : Prop
  curvatureTerm : Prop

structure HarmonicMapFlowEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (F : HarmonicMapFlowPackage M N) where
  gradientFlowEquationClosed : F.gradientFlowEquation
  shortTimeExistenceClosed : F.shortTimeExistence
  bochnerFormulaClosed : F.bochnerFormula
  curvatureTermClosed : F.curvatureTerm

def HarmonicMapFlowClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (F : HarmonicMapFlowPackage M N) : Prop :=
  F.gradientFlowEquation ∧ F.shortTimeExistence ∧ F.bochnerFormula ∧ F.curvatureTerm

theorem harmonic_map_flow_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (F : HarmonicMapFlowPackage M N) (Ev : HarmonicMapFlowEvidence F) :
    HarmonicMapFlowClosed F := by
  exact And.intro Ev.gradientFlowEquationClosed
    (And.intro Ev.shortTimeExistenceClosed
      (And.intro Ev.bochnerFormulaClosed Ev.curvatureTermClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse