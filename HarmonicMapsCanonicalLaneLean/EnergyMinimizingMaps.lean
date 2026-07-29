import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.EellsSampsonPDE

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EnergyMinimizerPackage {M N : Type u} [MetricSpace M] [MetricSpace N]
    (F : EellsSampsonPDEPackage M N) where
  longtimeConvergence : Prop
  limitMapHarmonic : Prop
  energyDecreasing : Prop
  singularSetControl : Prop

structure EnergyMinimizerEvidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {F : EellsSampsonPDEPackage M N} (Q : EnergyMinimizerPackage F) where
  longtimeConvergenceClosed : Q.longtimeConvergence
  limitMapHarmonicClosed : Q.limitMapHarmonic
  energyDecreasingClosed : Q.energyDecreasing
  singularSetControlClosed : Q.singularSetControl

def EnergyMinimizerClosed {M N : Type u} [MetricSpace M] [MetricSpace N]
    {F : EellsSampsonPDEPackage M N} (Q : EnergyMinimizerPackage F) : Prop :=
  Q.longtimeConvergence ∧ Q.limitMapHarmonic ∧ Q.energyDecreasing ∧ Q.singularSetControl

theorem energy_minimizer_closed_from_evidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {F : EellsSampsonPDEPackage M N} (Q : EnergyMinimizerPackage F)
    (Ev : EnergyMinimizerEvidence Q) : EnergyMinimizerClosed Q := by
  exact And.intro Ev.longtimeConvergenceClosed
    (And.intro Ev.limitMapHarmonicClosed
      (And.intro Ev.energyDecreasingClosed Ev.singularSetControlClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse