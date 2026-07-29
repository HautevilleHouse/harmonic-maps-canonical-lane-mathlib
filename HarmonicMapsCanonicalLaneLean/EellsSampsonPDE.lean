import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HarmonicMapsCanonicalLaneLean.HarmonicMapEnergy

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure EellsSampsonPDEPackage {M N : Type u} [MetricSpace M] [MetricSpace N] where
  domainManifold : M
  targetManifold : N
  heatFlowMap : M → ℝ → N
  parabolicSystem : Prop
  shortTimeExistence : Prop
  uniqueness : Prop

structure EellsSampsonPDEEvidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    (P : EellsSampsonPDEPackage M N) where
  parabolicSystemClosed : P.parabolicSystem
  shortTimeExistenceClosed : P.shortTimeExistence
  uniquenessClosed : P.uniqueness

def EellsSampsonPDEClosed {M N : Type u} [MetricSpace M] [MetricSpace N]
    (P : EellsSampsonPDEPackage M N) : Prop :=
  P.parabolicSystem ∧ P.shortTimeExistence ∧ P.uniqueness

theorem eells_sampson_pde_closed_from_evidence {M N : Type u} [MetricSpace M] [MetricSpace N]
    (P : EellsSampsonPDEPackage M N) (Ev : EellsSampsonPDEEvidence P) : EellsSampsonPDEClosed P := by
  exact And.intro Ev.parabolicSystemClosed (And.intro Ev.shortTimeExistenceClosed Ev.uniquenessClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse