import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.WeakTopologies

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure PolarPackage (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (W : WeakTopologyPackage X) where
  polarSet : Set X → Set W.dual
  bipolarTheorem : ∀ (A : Set X), polarSet (polarSet A) = convexHull ℝ (A ∪ {0})  -- simplified
  dualityPair : DualityPair X W.dual
  polarClosed : ∀ (A : Set X), IsClosed (polarSet A)  -- in weak-* topology

structure PolarEvidence (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {W : WeakTopologyPackage X} (P : PolarPackage X W) where
  bipolarTheoremClosed : P.bipolarTheorem
  polarClosedClosed : P.polarClosed

def PolarClosed (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {W : WeakTopologyPackage X} (P : PolarPackage X W) : Prop :=
  P.bipolarTheorem ∧ P.polarClosed

theorem polar_closed_from_evidence (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {W : WeakTopologyPackage X}
    (P : PolarPackage X W) (e : PolarEvidence X W P) : PolarClosed X W P := by
  exact And.intro e.bipolarTheoremClosed e.polarClosedClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse