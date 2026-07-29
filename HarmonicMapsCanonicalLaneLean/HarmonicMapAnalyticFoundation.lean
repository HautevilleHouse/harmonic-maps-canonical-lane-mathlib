import canonicalLaneMathlib.AdmissibleClass
import HarmonicMapsCanonicalLaneLean.HarmonicMapEquation
import HarmonicMapsCanonicalLaneLean.BochnerFormula
import HarmonicMapsCanonicalLaneLean.RegularityTheory
import HarmonicMapsCanonicalLaneLean.ExistenceMinimization
import HarmonicMapsCanonicalLaneLean.UniquenessRigidity
import HarmonicMapsCanonicalLaneLean.EellsSampsonTheorem

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapAnalyticFoundation (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  equation : HarmonicMapPackage M N
  equationEvidence : HarmonicMapEvidence equation
  bochner : BochnerFormulaPackage M N
  bochnerEvidence : BochnerFormulaEvidence bochner
  regularity : RegularityPackage M N
  regularityEvidence : RegularityEvidence regularity
  existence : ExistencePackage M N
  existenceEvidence : ExistenceEvidence existence
  uniqueness : UniquenessPackage M N
  uniquenessEvidence : UniquenessEvidence uniqueness
  eellsSampson : EellsSampsonPackage M N
  eellsSampsonEvidence : EellsSampsonEvidence eellsSampson

def HarmonicMapAnalyticFoundationClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (A : HarmonicMapAnalyticFoundation M N) : Prop :=
  HarmonicMapClosed A.equation ∧ BochnerFormulaClosed A.bochner ∧ RegularityClosed A.regularity ∧ ExistenceClosed A.existence ∧ UniquenessClosed A.uniqueness ∧ EellsSampsonClosed A.eellsSampson

theorem harmonic_map_analytic_foundation_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (A : HarmonicMapAnalyticFoundation M N) : HarmonicMapAnalyticFoundationClosed A := by
  refine And.intro (harmonic_map_closed_from_evidence A.equation A.equationEvidence) (And.intro (bochner_formula_closed_from_evidence A.bochner A.bochnerEvidence) (And.intro (regularity_closed_from_evidence A.regularity A.regularityEvidence) (And.intro (existence_closed_from_evidence A.existence A.existenceEvidence) (And.intro (uniqueness_closed_from_evidence A.uniqueness A.uniquenessEvidence) (eells_sampson_closed_from_evidence A.eellsSampson A.eellsSampsonEvidence)))))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
