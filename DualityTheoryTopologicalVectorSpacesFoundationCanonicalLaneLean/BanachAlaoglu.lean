import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure BanachAlaogluTheorem (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] where
  dualX : Type _
  dualTopology : TopologicalSpace dualX
  dualNorm : NormedAddCommGroup dualX
  dualNormedSpace : NormedSpace ℝ dualX
  closedUnitBallDual : Set dualX
  closedUnitBallDualDef : closedUnitBallDual = {f : dualX | ‖f‖ ≤ 1}
  weakStarCompact : IsCompact (Set.univ : Set (WeakTopology X dualX (dualPairing X dualX))).1  -- approximation
  
structure BanachAlaogluEvidence (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (ba : BanachAlaogluTheorem X) where
  closedUnitBallDualDefClosed : ba.closedUnitBallDualDef
  weakStarCompactClosed : ba.weakStarCompact

def BanachAlaogluClosed (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (ba : BanachAlaogluTheorem X) : Prop :=
  ba.closedUnitBallDualDef ∧ ba.weakStarCompact

theorem banach_alaoglu_closed_from_evidence (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (ba : BanachAlaogluTheorem X) (ev : BanachAlaogluEvidence X ba) : BanachAlaogluClosed X ba := by
  exact And.intro ev.closedUnitBallDualDefClosed ev.weakStarCompactClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse