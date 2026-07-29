import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.RegularityTheory

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EellsSampsonTheoremPackage {M N : Type u} [MetricSpace M] [MetricSpace N]
    (R : RegularityPackage (Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N))) where
  existenceOfHarmonicMap : Prop
  energyMinimizingProperty : Prop
  boundaryRegularity : Prop
  uniquenessUnderCurvature : Prop

structure EellsSampsonTheoremEvidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {R : RegularityPackage (Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N))}
    (T : EellsSampsonTheoremPackage R) where
  existenceOfHarmonicMapClosed : T.existenceOfHarmonicMap
  energyMinimizingPropertyClosed : T.energyMinimizingProperty
  boundaryRegularityClosed : T.boundaryRegularity
  uniquenessUnderCurvatureClosed : T.uniquenessUnderCurvature

def EellsSampsonTheoremClosed {M N : Type u} [MetricSpace M] [MetricSpace N]
    {R : RegularityPackage (Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N))}
    (T : EellsSampsonTheoremPackage R) : Prop :=
  T.existenceOfHarmonicMap ∧ T.energyMinimizingProperty ∧ T.boundaryRegularity ∧ T.uniquenessUnderCurvature

theorem eells_sampson_theorem_closed_from_evidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {R : RegularityPackage (Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N))}
    (T : EellsSampsonTheoremPackage R) (Ev : EellsSampsonTheoremEvidence T) : EellsSampsonTheoremClosed T := by
  exact And.intro Ev.existenceOfHarmonicMapClosed
    (And.intro Ev.energyMinimizingPropertyClosed
      (And.intro Ev.boundaryRegularityClosed Ev.uniquenessUnderCurvatureClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse