import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure PolarStructure where
  carrier : Type u
  tvs : TopologicalVectorSpace carrier
  pair : DualPair carrier
  polarSet : Set carrier → Set (LinearFunctional carrier)
  polarSetDefined : ∀ S : Set carrier, polarSet S = { f : LinearFunctional carrier | ∀ x ∈ S, |f x| ≤ 1 }

structure BipolarEvidence (P : PolarStructure) where
  polarSetDefinedClosed : P.polarSetDefined
  bipolarTheoremClosed : ∀ S : Set P.carrier, P.polarSet (P.polarSet S) = closure (convexHull (S ∪ {0}))

def BipolarClosed (P : PolarStructure) : Prop :=
  ∀ S : Set P.carrier, P.polarSet (P.polarSet S) = closure (convexHull (S ∪ {0}))

theorem bipolar_closed_from_evidence (P : PolarStructure) (E : BipolarEvidence P) : BipolarClosed P := by
  exact E.bipolarTheoremClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse