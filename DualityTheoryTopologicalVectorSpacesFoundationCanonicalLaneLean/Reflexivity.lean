import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure ReflexiveSpace (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] where
  doubleDual : Type _
  doubleDualTopology : TopologicalSpace doubleDual
  doubleDualNorm : NormedAddCommGroup doubleDual
  doubleDualNormedSpace : NormedSpace ℝ doubleDual
  canonicalEmbedding : X → doubleDual
  isIsometric : Isometry canonicalEmbedding
  isSurjective : Function.Surjective canonicalEmbedding

structure ReflexivityEvidence (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (r : ReflexiveSpace X) where
  isIsometricClosed : r.isIsometric
  isSurjectiveClosed : r.isSurjective

def ReflexivityClosed (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (r : ReflexiveSpace X) : Prop :=
  r.isIsometric ∧ r.isSurjective

theorem reflexivity_closed_from_evidence (X : Type _) [TopologicalSpace X] [NormedAddCommGroup X] [NormedSpace ℝ X] (r : ReflexiveSpace X) (ev : ReflexivityEvidence X r) : ReflexivityClosed X r := by
  exact And.intro ev.isIsometricClosed ev.isSurjectiveClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse