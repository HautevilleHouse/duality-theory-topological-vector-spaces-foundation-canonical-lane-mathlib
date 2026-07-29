import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure DualPairing (X Y : Type) [AddCommGroup X] [AddCommGroup Y] [Module ℝ X] [Module ℝ Y] where
  bilinearMap : X → Y → ℝ
  separatePoints : ∀ x ≠ 0, ∃ y, bilinearMap x y ≠ 0
  separatePoints' : ∀ y ≠ 0, ∃ x, bilinearMap x y ≠ 0

def WeakTopology (X Y : Type) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] [AddCommGroup Y] [Module ℝ Y]
  (pairing : DualPairing X Y) : TopologicalSpace X := by
  refine TopologicalSpace.induced (fun x ↦ (fun y ↦ pairing.bilinearMap x y)) (Pi.topologicalSpace (fun _ : Y ↦ ℝ)) ?_
  exact TopologicalSpace.induced (fun f : X → (Y → ℝ) ↦ f) (Pi.topologicalSpace (fun _ : Y ↦ ℝ))

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse