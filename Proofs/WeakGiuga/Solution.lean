import Proofs.WeakGiuga.Plan
import Proofs.WeakGiuga.PrimeDivisorCondition
import Proofs.WeakGiuga.ReciprocalSum

theorem WeakGiuga.isWeakGiuga_iff_sum_primeFactors {n : ℕ} (hn : WeakGiuga.Composite n) :
    WeakGiuga.IsWeakGiuga n ↔ ∃ m : ℕ, ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = m :=
  WeakGiuga.plan WeakGiuga.isWeakGiuga_iff_primeDivisorCondition
    WeakGiuga.primeDivisorCondition_iff_reciprocalSumIsNat hn
