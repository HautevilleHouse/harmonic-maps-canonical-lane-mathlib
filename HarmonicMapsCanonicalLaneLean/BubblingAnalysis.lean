import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HarmonicMapsCanonicalLaneLean

structure BubblingAnalysisPackage where
  energyConcentrationSet : Type u
  bubbleTreeFormation : Prop
  neckRegions : Prop
  energyIdentity : Prop
  bubbleTreeFormationTerm : bubbleTreeFormation
  neckRegionsTerm : neckRegions
  energyIdentityTerm : energyIdentity

structure BubblingAnalysisEvidence (B : BubblingAnalysisPackage) where
  bubbleTreeFormationClosed : B.bubbleTreeFormation
  neckRegionsClosed : B.neckRegions
  energyIdentityClosed : B.energyIdentity

def BubblingAnalysisClosed (B : BubblingAnalysisPackage) : Prop :=
  B.bubbleTreeFormation ∧ B.neckRegions ∧ B.energyIdentity

theorem bubbling_analysis_closed_from_evidence (B : BubblingAnalysisPackage)
    (Ev : BubblingAnalysisEvidence B) : BubblingAnalysisClosed B := by
  exact And.intro Ev.bubbleTreeFormationClosed
    (And.intro Ev.neckRegionsClosed Ev.energyIdentityClosed)

end HarmonicMapsCanonicalLaneLean
end HautevilleHouse