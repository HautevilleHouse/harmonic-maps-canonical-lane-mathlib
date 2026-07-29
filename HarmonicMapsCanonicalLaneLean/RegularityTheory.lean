import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.EnergyMinimizingMaps

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure RegularityPackage {M N : Type u} [MetricSpace M] [MetricSpace N]
    (Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N)) where
  interiorRegularity : Prop
  partialRegularity : Prop
  dimensionEstimate : Prop
  singularSetHausdorffDimension : Prop

structure RegularityEvidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N)}
    (R : RegularityPackage Q) where
  interiorRegularityClosed : R.interiorRegularity
  partialRegularityClosed : R.partialRegularity
  dimensionEstimateClosed : R.dimensionEstimate
  singularSetHausdorffDimensionClosed : R.singularSetHausdorffDimension

def RegularityClosed {M N : Type u} [MetricSpace M] [MetricSpace N]
    {Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N)}
    (R : RegularityPackage Q) : Prop :=
  R.interiorRegularity ∧ R.partialRegularity ∧ R.dimensionEstimate ∧ R.singularSetHausdorffDimension

theorem regularity_closed_from_evidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    {Q : EnergyMinimizerPackage (F : EellsSampsonPDEPackage M N)}
    (R : RegularityPackage Q) (Ev : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.partialRegularityClosed
      (And.intro Ev.dimensionEstimateClosed Ev.singularSetHausdorffDimensionClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse