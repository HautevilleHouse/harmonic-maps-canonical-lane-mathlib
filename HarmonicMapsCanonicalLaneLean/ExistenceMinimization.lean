import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure ExistencePackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  dirichletEnergy : Type
  minimizerExists : Prop
  eulerLagrangeSatisfied : Prop

structure ExistenceEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (E : ExistencePackage M N) where
  minimizerExistsClosed : E.minimizerExists
  eulerLagrangeSatisfiedClosed : E.eulerLagrangeSatisfied

def ExistenceClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (E : ExistencePackage M N) : Prop :=
  E.minimizerExists ∧ E.eulerLagrangeSatisfied

theorem existence_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] (E : ExistencePackage M N) (Ev : ExistenceEvidence E) : ExistenceClosed E := by
  exact And.intro Ev.minimizerExistsClosed Ev.eulerLagrangeSatisfiedClosed

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse
