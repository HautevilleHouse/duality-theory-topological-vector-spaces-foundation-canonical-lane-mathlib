import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure DualityTVSAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  vectorSpace : Module ℝ space
  locallyConvex : Prop
  dualSpace : Type v
  dualTopology : TopologicalSpace dualSpace
  pairing : space → dualSpace → ℝ
  separatedDuality : Prop

structure AdmissibleClass where
  object : DualityTVSAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DualityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse