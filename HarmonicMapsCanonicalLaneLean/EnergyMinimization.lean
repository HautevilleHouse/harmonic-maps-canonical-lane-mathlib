import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EnergyMinimizationPackage where
  dirichletEnergy : Type u
  criticalPointCondition : Prop
  convexityUnderFlow : Prop
  uniquenessOfMinimizer : Prop
  criticalPointConditionTerm : criticalPointCondition
  convexityUnderFlowTerm : convexityUnderFlow
  uniquenessOfMinimizerTerm : uniquenessOfMinimizer

structure EnergyMinimizationEvidence (E : EnergyMinimizationPackage) where
  criticalPointConditionClosed : E.criticalPointCondition
  convexityUnderFlowClosed : E.convexityUnderFlow
  uniquenessOfMinimizerClosed : E.uniquenessOfMinimizer

def EnergyMinimizationClosed (E : EnergyMinimizationPackage) : Prop :=
  E.criticalPointCondition ∧ E.convexityUnderFlow ∧ E.uniquenessOfMinimizer

theorem energy_minimization_closed_from_evidence (E : EnergyMinimizationPackage)
    (Ev : EnergyMinimizationEvidence E) : EnergyMinimizationClosed E := by
  exact And.intro Ev.criticalPointConditionClosed
    (And.intro Ev.convexityUnderFlowClosed Ev.uniquenessOfMinimizerClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse