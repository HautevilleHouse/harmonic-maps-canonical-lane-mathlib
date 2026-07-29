import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapSetup
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.BochnerRegularity

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure ExistenceAndRegularityPackage {H : HarmonicMapPackage} (B : BochnerRegularityPackage H) where
  existenceGivenBoundary : Prop
  partialRegularity : Prop
  stationaryExtension : Prop

structure ExistenceAndRegularityEvidence {H : HarmonicMapPackage} {B : BochnerRegularityPackage H} (E : ExistenceAndRegularityPackage B) where
  existenceGivenBoundaryClosed : E.existenceGivenBoundary
  partialRegularityClosed : E.partialRegularity
  stationaryExtensionClosed : E.stationaryExtension

def ExistenceAndRegularityClosed {H : HarmonicMapPackage} {B : BochnerRegularityPackage H} (E : ExistenceAndRegularityPackage B) : Prop :=
  E.existenceGivenBoundary ∧ E.partialRegularity ∧ E.stationaryExtension

theorem existence_and_regularity_closed_from_evidence {H : HarmonicMapPackage} {B : BochnerRegularityPackage H} (E : ExistenceAndRegularityPackage B) (Ev : ExistenceAndRegularityEvidence E) :
    ExistenceAndRegularityClosed E := by
  exact And.intro Ev.existenceGivenBoundaryClosed (And.intro Ev.partialRegularityClosed Ev.stationaryExtensionClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
