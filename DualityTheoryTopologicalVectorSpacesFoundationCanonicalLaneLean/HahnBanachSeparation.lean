import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure HahnBanachPackage where
  carrier : Type u
  tvs : TopologicalVectorSpace carrier
  sublinearFunctional : SublinearFunctional carrier
  dominatedExtension : Prop
  separationTheorems : Prop
  extensionProperty : ∀ U : LocallyConvexTVS.carrier, True

structure HahnBanachEvidence (H : HahnBanachPackage) where
  dominatedExtensionClosed : H.dominatedExtension
  separationTheoremsClosed : H.separationTheorems

def HahnBanachClosed (H : HahnBanachPackage) : Prop :=
  H.dominatedExtension ∧ H.separationTheorems

theorem hahn_banach_closed_from_evidence (H : HahnBanachPackage) (E : HahnBanachEvidence H) : HahnBanachClosed H := by
  exact And.intro E.dominatedExtensionClosed E.separationTheoremsClosed

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse