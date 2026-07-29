import canonicalLaneMathlib.AdmissibleClass
import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.BridgeLemmas
import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

def CanonicalTVSClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem canonial_tvs_endgame (A : AdmissibleClass) :
    CanonicalTVSClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse