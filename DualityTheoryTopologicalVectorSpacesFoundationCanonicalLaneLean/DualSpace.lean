import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure DualSpace (V : TopologicalVectorSpace) where
  dual : Type u
  dualAdditiveGroup : AddCommGroup dual
  dualTopology : TopologicalSpace dual
  strongTopology : TopologicalSpace dual
  pairing : V.carrier → dual → ℝ
  bilinearContinuous : Continuous (fun (x : V.carrier × dual) => pairing x.1 x.2)
  separatingSet : Set dual
  separatesPoints : ∀ (x : V.carrier), x ≠ 0 → ∃ (f : dual), pairing x f ≠ 0

def DualSpaceClosed {V : TopologicalVectorSpace} (D : DualSpace V) : Prop :=
  D.bilinearContinuous ∧ D.separatesPoints

structure DualSpaceEvidence {V : TopologicalVectorSpace} (D : DualSpace V) where
  bilinearContinuousClosed : D.bilinearContinuous
  separatesPointsClosed : D.separatesPoints

theorem dual_space_closed_from_evidence
    {V : TopologicalVectorSpace} (D : DualSpace V) (E : DualSpaceEvidence D) :
    DualSpaceClosed D := by
  exact And.intro E.bilinearContinuousClosed E.separatesPointsClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse