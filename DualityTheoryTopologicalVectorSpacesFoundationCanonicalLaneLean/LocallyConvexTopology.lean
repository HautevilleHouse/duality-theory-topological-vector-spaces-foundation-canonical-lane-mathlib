import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure LocallyConvexTVS where
  carrier : Type u
  tvs : TopologicalVectorSpace carrier
  originNeighborhoodBasis : Set (Set carrier)
  convexBasis : Set (Set carrier)
  convexBasisIsBasis : TopologicalSpace.IsLocalBasis (0 : carrier) originNeighborhoodBasis
  convexBasisIsConvex : ∀ U ∈ originNeighborhoodBasis, Convex carrier U
  convexBasisIsBalanced : ∀ U ∈ originNeighborhoodBasis, Balanced carrier U
  convexBasisIsAbsorbent : ∀ U ∈ originNeighborhoodBasis, Absorbent carrier U

structure LocallyConvexEvidence (L : LocallyConvexTVS) where
  convexBasisIsBasisClosed : L.convexBasisIsBasis
  convexBasisIsConvexClosed : L.convexBasisIsConvex
  convexBasisIsBalancedClosed : L.convexBasisIsBalanced
  convexBasisIsAbsorbentClosed : L.convexBasisIsAbsorbent

def LocallyConvexClosed (L : LocallyConvexTVS) : Prop :=
  L.convexBasisIsBasis ∧ L.convexBasisIsConvex ∧ L.convexBasisIsBalanced ∧ L.convexBasisIsAbsorbent

theorem locally_convex_closed_from_evidence (L : LocallyConvexTVS) (E : LocallyConvexEvidence L) : LocallyConvexClosed L := by
  exact And.intro E.convexBasisIsBasisClosed (And.intro E.convexBasisIsConvexClosed (And.intro E.convexBasisIsBalancedClosed E.convexBasisIsAbsorbentClosed))

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse