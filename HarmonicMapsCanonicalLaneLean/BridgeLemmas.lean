import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HarmonicMapsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse