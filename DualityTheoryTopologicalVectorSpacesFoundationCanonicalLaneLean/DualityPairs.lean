import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.TVSAdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure DualityPair (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] [AddCommGroup X] [AddCommGroup Y] [Module ℝ X] [Module ℝ Y] where
  pairing : X → Y → ℝ
  bilinear : ∀ (x1 x2 : X) (y : Y), pairing (x1 + x2) y = pairing x1 y + pairing x2 y ∧
              ∀ (x : X) (y1 y2 : Y), pairing x (y1 + y2) = pairing x y1 + pairing x y2
  separatePoints : ∀ x : X, (∀ y : Y, pairing x y = 0) → x = 0

structure DualityPairEvidence (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] [AddCommGroup X] [AddCommGroup Y] [Module ℝ X] [Module ℝ Y] (dp : DualityPair X Y) where
  bilinearClosed : dp.bilinear
  separatePointsClosed : dp.separatePoints

def DualityPairClosed (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] [AddCommGroup X] [AddCommGroup Y] [Module ℝ X] [Module ℝ Y] (dp : DualityPair X Y) : Prop :=
  dp.bilinear ∧ dp.separatePoints

theorem duality_pair_closed_from_evidence (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] [AddCommGroup X] [AddCommGroup Y] [Module ℝ X] [Module ℝ Y]
    (dp : DualityPair X Y) (e : DualityPairEvidence X Y dp) : DualityPairClosed X Y dp := by
  exact And.intro e.bilinearClosed e.separatePointsClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse