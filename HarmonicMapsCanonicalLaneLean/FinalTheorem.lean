import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapSetup
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.BochnerRegularity
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.ExistenceAndRegularity

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

def ConstrainedHarmonicMapsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_harmonic_maps_endgame (A : AdmissibleClass) :
    ConstrainedHarmonicMapsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
