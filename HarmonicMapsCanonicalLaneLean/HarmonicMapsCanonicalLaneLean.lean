import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapEnergy
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.EnergyMinimization
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.RegularityResults
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.BochnerFormula
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.EellsSampsonTheorem

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

def ConstrainedHarmonicMapClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_harmonic_map_endgame (A : AdmissibleClass) :
    ConstrainedHarmonicMapClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse