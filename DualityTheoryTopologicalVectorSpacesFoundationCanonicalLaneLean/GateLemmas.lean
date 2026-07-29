import DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse