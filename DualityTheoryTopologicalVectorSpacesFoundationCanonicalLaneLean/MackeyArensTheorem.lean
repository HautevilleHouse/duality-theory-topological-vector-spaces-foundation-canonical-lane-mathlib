import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure MackeyArensTheorem (V : TopologicalVectorSpace) (W : DualSpace V) where
  mackeyTopology : TopologicalSpace V.carrier
  mackeyTopologyIsMackey : MackeyTopology ℝ (V.carrier) (W.dual) W.pairing
  consistentTopologies : Set (TopologicalSpace V.carrier)
  consistentTopologiesCharacterization :
    ∀ (τ : TopologicalSpace V.carrier), τ ∈ consistentTopologies ↔
      (ContinuousLinearMap.dualTopology τ = W.weakStarTopology ∧
       τ ≤ mackeyTopology ∧ τ ≥ W.weakTopology)
  mackeyTopologyMaximal : ∀ (τ : TopologicalSpace V.carrier),
    (ContinuousLinearMap.dualTopology τ = W.weakStarTopology) → τ ≤ mackeyTopology

def MackeyArensTheoremClosed {V : TopologicalVectorSpace} {W : DualSpace V} (M : MackeyArensTheorem V W) : Prop :=
  M.mackeyTopologyIsMackey ∧ M.mackeyTopologyMaximal

structure MackeyArensTheoremEvidence {V : TopologicalVectorSpace} {W : DualSpace V} (M : MackeyArensTheorem V W) where
  mackeyTopologyIsMackeyClosed : M.mackeyTopologyIsMackey
  mackeyTopologyMaximalClosed : M.mackeyTopologyMaximal

theorem mackey_arens_theorem_closed_from_evidence
    {V : TopologicalVectorSpace} {W : DualSpace V} (M : MackeyArensTheorem V W)
    (E : MackeyArensTheoremEvidence M) : MackeyArensTheoremClosed M := by
  exact And.intro E.mackeyTopologyIsMackeyClosed E.mackeyTopologyMaximalClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse