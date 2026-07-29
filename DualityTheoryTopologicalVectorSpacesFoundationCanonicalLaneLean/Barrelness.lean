import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.DualPairing

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure BarrelSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  isBarrel : Prop
  absorbent : Prop
  balanced : Prop
  convex : Prop
  closed : Prop

structure BarrPropositionPackage where
  dualPairing : DualPairing ℝ ℝ
  barrelSpace : BarrelSpace
  barrelledSpaceCondition : Prop
  barthelTheoremHolds : Prop

structure BarrPropositionEvidence (B : BarrPropositionPackage) where
  barrelledSpaceConditionClosed : B.barrelledSpaceCondition
  barthelTheoremHoldsClosed : B.barthelTheoremHolds

def BarrPropositionClosed (B : BarrPropositionPackage) : Prop :=
  B.barrelledSpaceCondition ∧ B.barthelTheoremHolds

theorem barr_proposition_closed_from_evidence (B : BarrPropositionPackage) (E : BarrPropositionEvidence B) :
    BarrPropositionClosed B := by
  exact And.intro E.barrelledSpaceConditionClosed E.barthelTheoremHoldsClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse