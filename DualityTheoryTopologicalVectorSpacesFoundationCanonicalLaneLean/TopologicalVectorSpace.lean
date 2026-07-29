import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure TopologicalVectorSpace where
  carrier : Type u
  additiveGroup : AddCommGroup carrier
  topology : TopologicalSpace carrier
  continuousAddition : Continuous (fun (x : carrier × carrier) => x.1 + x.2)
  continuousScalar : Continuous (fun (kx : ℝ × carrier) => kx.1 • kx.2)
  hausdorff : T2Space carrier
  locallyConvex : LocallyConvexSpace ℝ carrier
  locallyConvexTopology : Topology.IsLocallyConvex (𝕜 := ℝ) (E := carrier) topology

structure TopologicalVectorSpaceEvidence (V : TopologicalVectorSpace) where
  additiveGroupClosed : V.additiveGroup = V.additiveGroup
  topologyClosed : V.topology = V.topology
  continuousAdditionClosed : V.continuousAddition
  continuousScalarClosed : V.continuousScalar
  hausdorffClosed : V.hausdorff
  locallyConvexClosed : V.locallyConvex

def TopologicalVectorSpaceClosed (V : TopologicalVectorSpace) : Prop :=
  V.continuousAddition ∧ V.continuousScalar ∧ V.hausdorff ∧ V.locallyConvex

theorem topological_vector_space_closed_from_evidence
    (V : TopologicalVectorSpace) (E : TopologicalVectorSpaceEvidence V) :
    TopologicalVectorSpaceClosed V := by
  exact And.intro E.continuousAdditionClosed
    (And.intro E.continuousScalarClosed
      (And.intro E.hausdorffClosed E.locallyConvexClosed))

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse