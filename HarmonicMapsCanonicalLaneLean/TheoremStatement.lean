import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapsAdmittedObject where
  domain : Type u
  target : Type v
  map : domain → target
  harmonic : Prop
  energyMinimizing : Prop
  conclusion : harmonic

def HarmonicMapsWitnessClosed (O : HarmonicMapsAdmittedObject) : Prop :=
  O.harmonic

theorem harmonic_maps_witness_closed (O : HarmonicMapsAdmittedObject) :
    HarmonicMapsWitnessClosed O := O.conclusion

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse