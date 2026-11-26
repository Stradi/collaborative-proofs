import Proofs.WeakGiuga.Claims

namespace WeakGiuga

theorem plan (primeDivisor : PrimeDivisorClaim) (reciprocalSum : ReciprocalSumClaim)
    {n : ℕ} (hn : Composite n) :
    IsWeakGiuga n ↔ ∃ m : ℕ, ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = m :=
  (primeDivisor hn).trans (reciprocalSum hn)

end WeakGiuga
