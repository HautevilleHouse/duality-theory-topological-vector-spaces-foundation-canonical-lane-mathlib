import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.DualityPairs

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure WeakTopologyPackage (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] where
  dual : Type v
  dualTopology : TopologicalSpace dual
  dualVectorSpace : Module ℝ dual
  pairing : X → dual → ℝ
  weakTopology : TopologicalSpace X
  weakContinuity : ∀ (x : X), Continuous (pairing x)
  weakT2 : T2Space X

structure WeakTopologyEvidence (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (W : WeakTopologyPackage X) where
  weakContinuityClosed : W.weakContinuity
  weakT2Closed : W.weakT2

def WeakTopologyClosed (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (W : WeakTopologyPackage X) : Prop :=
  W.weakContinuity ∧ W.weakT2

theorem weak_topology_closed_from_evidence (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (W : WeakTopologyPackage X) (e : WeakTopologyEvidence X W) : WeakTopologyClosed X W := by
  exact And.intro e.weakContinuityClosed e.weakT2Closed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse