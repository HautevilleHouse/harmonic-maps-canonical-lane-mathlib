import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapPackage where
  sourceManifold : Type u
  targetManifold : Type v
  smoothMap : sourceManifold → targetManifold
  energyFunctional : Prop
  eulerLagrangeEquation : Prop
  harmonicCondition : Prop

structure HarmonicMapEvidence (H : HarmonicMapPackage) where
  energyFunctionalClosed : H.energyFunctional
  eulerLagrangeEquationClosed : H.eulerLagrangeEquation
  harmonicConditionClosed : H.harmonicCondition

def HarmonicMapClosed (H : HarmonicMapPackage) : Prop :=
  H.energyFunctional ∧ H.eulerLagrangeEquation ∧ H.harmonicCondition

theorem harmonic_map_closed_from_evidence (H : HarmonicMapPackage) (E : HarmonicMapEvidence H) :
    HarmonicMapClosed H := by
  exact And.intro E.energyFunctionalClosed (And.intro E.eulerLagrangeEquationClosed E.harmonicConditionClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
