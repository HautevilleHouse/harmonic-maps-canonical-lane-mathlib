import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure SiuSampsonRigidityPackage where
  harmonicMap : Type u
  targetConditions : Prop
  mapIsHolomorphic : Prop
  factorizationThroughHermitianSymmetricDomain : Prop
  targetConditionsTerm : targetConditions
  mapIsHolomorphicTerm : mapIsHolomorphic
  factorizationThroughHermitianSymmetricDomainTerm : factorizationThroughHermitianSymmetricDomain

structure SiuSampsonRigidityEvidence (S : SiuSampsonRigidityPackage) where
  targetConditionsClosed : S.targetConditions
  mapIsHolomorphicClosed : S.mapIsHolomorphic
  factorizationThroughHermitianSymmetricDomainClosed : S.factorizationThroughHermitianSymmetricDomain

def SiuSampsonRigidityClosed (S : SiuSampsonRigidityPackage) : Prop :=
  S.targetConditions ∧ S.mapIsHolomorphic ∧ S.factorizationThroughHermitianSymmetricDomain

theorem siu_sampson_rigidity_closed_from_evidence (S : SiuSampsonRigidityPackage)
    (Ev : SiuSampsonRigidityEvidence S) : SiuSampsonRigidityClosed S := by
  exact And.intro Ev.targetConditionsClosed
    (And.intro Ev.mapIsHolomorphicClosed Ev.factorizationThroughHermitianSymmetricDomainClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse