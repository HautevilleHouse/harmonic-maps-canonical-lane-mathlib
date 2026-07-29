import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapEnergyPackage where
  dirichletEnergy : Type u
  tensionField : Type v
  energyFunctionalDifferentiable : Prop
  firstVariationFormula : Prop
  criticalPointsAreHarmonic : Prop

structure HarmonicMapEnergyEvidence (E : HarmonicMapEnergyPackage) where
  energyFunctionalDifferentiableClosed : E.energyFunctionalDifferentiable
  firstVariationFormulaClosed : E.firstVariationFormula
  criticalPointsAreHarmonicClosed : E.criticalPointsAreHarmonic

def HarmonicMapEnergyClosed (E : HarmonicMapEnergyPackage) : Prop :=
  E.energyFunctionalDifferentiable ∧ E.firstVariationFormula ∧ E.criticalPointsAreHarmonic

theorem harmonic_map_energy_closed_from_evidence (E : HarmonicMapEnergyPackage)
    (Ev : HarmonicMapEnergyEvidence E) : HarmonicMapEnergyClosed E := by
  exact And.intro Ev.energyFunctionalDifferentiableClosed
    (And.intro Ev.firstVariationFormulaClosed Ev.criticalPointsAreHarmonicClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse