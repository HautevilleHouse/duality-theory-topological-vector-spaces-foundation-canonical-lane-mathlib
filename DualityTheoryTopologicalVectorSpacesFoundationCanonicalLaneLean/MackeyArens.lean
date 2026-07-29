import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.DualPairing

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure MackeyArensPackage where
  dualPairing : DualPairing ℝ ℝ
  compatibleTopology : TopologicalSpace ℝ
  mackeyTopology : TopologicalSpace ℝ
  AreMatching : Prop
  mackeyArensTheoremHolds : Prop

structure MackeyArensEvidence (M : MackeyArensPackage) where
  AreMatchingClosed : M.AreMatching
  mackeyArensTheoremHoldsClosed : M.mackeyArensTheoremHolds

def MackeyArensClosed (M : MackeyArensPackage) : Prop :=
  M.AreMatching ∧ M.mackeyArensTheoremHolds

theorem mackey_arens_closed_from_evidence (M : MackeyArensPackage) (E : MackeyArensEvidence M) :
    MackeyArensClosed M := by
  exact And.intro E.AreMatchingClosed E.mackeyArensTheoremHoldsClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse