import Proofs.WeakGiuga.Claims

/-- Formal Conjectures `AgohGiuga.isWeakGiuga_iff_sum_primeFactors`. -/
theorem WeakGiuga.isWeakGiuga_iff_sum_primeFactors {n : ℕ} (hn : WeakGiuga.Composite n) :
    WeakGiuga.IsWeakGiuga n ↔ ∃ m : ℕ, ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = m := by
  sorry
