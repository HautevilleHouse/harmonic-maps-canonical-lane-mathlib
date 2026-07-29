import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure AdmissibleClass where
  object : HarmonicMapsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  HarmonicMapsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse