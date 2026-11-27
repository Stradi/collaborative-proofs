import Proofs.ErdosMoser.Claims

open scoped BigOperators

namespace ErdosMoser

theorem plan : MoserRestrictionClaim → RestrictedObstructionClaim → ProblemClaim := by
  intro restrict exclude k m hk even hm eq
  obtain ⟨lower, residue⟩ := restrict k m hk even hm eq
  exact exclude k m hk even lower residue eq

end ErdosMoser
