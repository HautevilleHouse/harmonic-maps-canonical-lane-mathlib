import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure HarmonicMapUniquenessPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  hartmanUniqueness : Prop
  boundaryDataFixed : Prop
  homotopyClass : Prop
  energyMinimizerUnique : Prop

structure HarmonicMapUniquenessEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (U : HarmonicMapUniquenessPackage M N) where
  hartmanUniquenessClosed : U.hartmanUniqueness
  boundaryDataFixedClosed : U.boundaryDataFixed
  homotopyClassClosed : U.homotopyClass
  energyMinimizerUniqueClosed : U.energyMinimizerUnique

def HarmonicMapUniquenessClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (U : HarmonicMapUniquenessPackage M N) : Prop :=
  U.hartmanUniqueness ∧ U.boundaryDataFixed ∧ U.homotopyClass ∧ U.energyMinimizerUnique

theorem harmonic_map_uniqueness_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (U : HarmonicMapUniquenessPackage M N) (Ev : HarmonicMapUniquenessEvidence U) :
    HarmonicMapUniquenessClosed U := by
  exact And.intro Ev.hartmanUniquenessClosed
    (And.intro Ev.boundaryDataFixedClosed
      (And.intro Ev.homotopyClassClosed Ev.energyMinimizerUniqueClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse