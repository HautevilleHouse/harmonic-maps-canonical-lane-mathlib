import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapEnergy

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure RegularityPackage {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    [RiemannianManifold M] [RiemannianManifold N]
    (E : HarmonicMapEnergyPackage M N) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  optimalRegularityClass : Prop

def RegularityClosed (R : RegularityPackage E) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.optimalRegularityClass

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse