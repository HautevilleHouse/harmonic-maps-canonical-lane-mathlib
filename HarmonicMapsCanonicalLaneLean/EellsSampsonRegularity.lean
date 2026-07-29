import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EellsSampsonRegularityPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N] where
  initialRegularity : Prop
  parabolicRegularity : Prop
  globalRegularity : Prop
  smoothLimit : Prop

structure EellsSampsonRegularityEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (R : EellsSampsonRegularityPackage M N) where
  initialRegularityClosed : R.initialRegularity
  parabolicRegularityClosed : R.parabolicRegularity
  globalRegularityClosed : R.globalRegularity
  smoothLimitClosed : R.smoothLimit

def EellsSampsonRegularityClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (R : EellsSampsonRegularityPackage M N) : Prop :=
  R.initialRegularity ∧ R.parabolicRegularity ∧ R.globalRegularity ∧ R.smoothLimit

theorem eells_sampson_regularity_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [RiemannianManifold M] [RiemannianManifold N]
    (R : EellsSampsonRegularityPackage M N) (Ev : EellsSampsonRegularityEvidence R) :
    EellsSampsonRegularityClosed R := by
  exact And.intro Ev.initialRegularityClosed
    (And.intro Ev.parabolicRegularityClosed
      (And.intro Ev.globalRegularityClosed Ev.smoothLimitClosed))

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse