import Proofs.ErdosMoser.Claims

namespace ErdosMoser

theorem plan : MoserRestrictionClaim → PrimeRestrictionsClaim → RestrictedObstructionClaim → ProblemClaim := by
  intro restrict primes exclude k m hk even hm eq
  obtain ⟨lower, residue⟩ := restrict k m hk even hm eq
  exact exclude k m hk even lower residue (primes k m hk even hm eq) eq

end ErdosMoser
