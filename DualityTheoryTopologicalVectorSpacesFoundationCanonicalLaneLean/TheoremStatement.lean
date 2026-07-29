import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean

structure TVSSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  linearStructure : AddCommGroup carrier
  moduleStructure : Module ℝ carrier
  topologicalVectorSpace : TopologicalVectorSpace ℝ carrier

structure AdmittedTVS where
  space : TVSSpace
  dualSpace : Type
  dualTopology : TopologicalSpace dualSpace
  dualModule : Module ℝ dualSpace
  pairing : space.carrier → dualSpace → ℝ
  separatingPairing : Prop
  strongDuality : Prop
  conclusion : strongDuality

def TVSWitnessClosed (O : AdmittedTVS) : Prop :=
  O.strongDuality

end DualityTheoryTopologicalVectorSpacesFoundationCanonicalLaneLean
end HautevilleHouse