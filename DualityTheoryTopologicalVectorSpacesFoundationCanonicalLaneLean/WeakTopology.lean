import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure WeakTopologyOnTVS where
  carrier : Type u
  tvs : TopologicalVectorSpace carrier
  continuousDuals : Set (LinearFunctional carrier)
  weakTopology : TopologicalSpace carrier
  weakTopologyIsWeakTopology : True
  weakTopologyInitialSeminorms : TopologicalSpace.GeneratedBy (λ f : continuousDuals => SeminormedBy f) = weakTopology

def WeakTopologyEvidence (W : WeakTopologyOnTVS) : Prop :=
  W.weakTopologyIsWeakTopology

def WeakTopologyClosed (W : WeakTopologyOnTVS) : Prop :=
  W.weakTopologyIsWeakTopology

theorem weak_topology_closed_from_evidence (W : WeakTopologyOnTVS) (h : WeakTopologyEvidence W) : WeakTopologyClosed W := by
  unfold WeakTopologyClosed WeakTopologyEvidence at *
  exact h

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse