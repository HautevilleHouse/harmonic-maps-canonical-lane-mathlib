import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapSetup

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure BochnerRegularityPackage (H : HarmonicMapPackage) where
  stressEnergyTensor : Prop
  monotonicityFormula : Prop
  epsilonRegularity : Prop
  removableSingularities : Prop

structure BochnerRegularityEvidence {H : HarmonicMapPackage} (B : BochnerRegularityPackage H) where
  stressEnergyTensorClosed : B.stressEnergyTensor
  monotonicityFormulaClosed : B.monotonicityFormula
  epsilonRegularityClosed : B.epsilonRegularity
  removableSingularitiesClosed : B.removableSingularities

def BochnerRegularityClosed {H : HarmonicMapPackage} (B : BochnerRegularityPackage H) : Prop :=
  B.stressEnergyTensor ∧ B.monotonicityFormula ∧ B.epsilonRegularity ∧ B.removableSingularities

theorem bochner_regularity_closed_from_evidence {H : HarmonicMapPackage} (B : BochnerRegularityPackage H) (E : BochnerRegularityEvidence B) :
    BochnerRegularityClosed B := by
  exact And.intro E.stressEnergyTensorClosed (And.intro E.monotonicityFormulaClosed (And.intro E.epsilonRegularityClosed E.removableSingularitiesClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
