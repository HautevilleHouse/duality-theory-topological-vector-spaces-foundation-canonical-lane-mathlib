import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.DualPairing

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure MackeyTopologyPackage {X : Type u} {Y : Type v} (D : DualPairingPackage X Y) where
  mackeyTopology : TopologicalSpace X
  topologyOfUniformConvergenceOnAbsConvexWeakStarCompact : Prop
  finestLocallyConvexTopology : Prop
  finestLocallyConvexTopologyTerm : finestLocallyConvexTopology

structure MackeyTopologyEvidence {X : Type u} {Y : Type v} {D : DualPairingPackage X Y} (M : MackeyTopologyPackage D) where
  topologyOfUniformConvergenceOnAbsConvexWeakStarCompactClosed : M.topologyOfUniformConvergenceOnAbsConvexWeakStarCompact

def MackeyTopologyClosed {X : Type u} {Y : Type v} {D : DualPairingPackage X Y} (M : MackeyTopologyPackage D) : Prop :=
  M.topologyOfUniformConvergenceOnAbsConvexWeakStarCompact ∧ M.finestLocallyConvexTopology

theorem mackey_topology_closed_from_evidence {X : Type u} {Y : Type v} {D : DualPairingPackage X Y} (M : MackeyTopologyPackage D) (E : MackeyTopologyEvidence M) : MackeyTopologyClosed M := by
  exact And.intro E.topologyOfUniformConvergenceOnAbsConvexWeakStarCompactClosed M.finestLocallyConvexTopologyTerm

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse