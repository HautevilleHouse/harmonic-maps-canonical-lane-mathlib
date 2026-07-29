import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EellsSampsonEnergyPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  energyFunctionalDefined : Prop
  stressEnergyTensor : Prop
  firstVariationFormula : Prop
  secondVariationFormula : Prop

structure EellsSampsonEnergyEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : EellsSampsonEnergyPackage M N) where
  energyFunctionalDefinedClosed : E.energyFunctionalDefined
  stressEnergyTensorClosed : E.stressEnergyTensor
  firstVariationFormulaClosed : E.firstVariationFormula
  secondVariationFormulaClosed : E.secondVariationFormula

def EellsSampsonEnergyClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : EellsSampsonEnergyPackage M N) : Prop :=
  E.energyFunctionalDefined ∧ E.stressEnergyTensor ∧ E.firstVariationFormula ∧ E.secondVariationFormula

theorem eells_sampson_energy_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (E : EellsSampsonEnergyPackage M N) (Ev : EellsSampsonEnergyEvidence E) :
    EellsSampsonEnergyClosed E := by
  exact And.intro Ev.energyFunctionalDefinedClosed
    (And.intro Ev.stressEnergyTensorClosed
      (And.intro Ev.firstVariationFormulaClosed Ev.secondVariationFormulaClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse