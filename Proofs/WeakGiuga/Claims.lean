import Mathlib.Data.Nat.Totient
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Algebra.BigOperators.Field

/-!
# Weak Giuga numbers: approved definitions and task claims

`IsWeakGiuga` follows `AgohGiuga.IsWeakGiuga` in Google DeepMind's Formal Conjectures
(`FormalConjectures/Wikipedia/AgohGiuga.lean`, Apache-2.0).
-/

namespace WeakGiuga

/-- `n` is composite: greater than one and not prime. -/
def Composite (n : ℕ) : Prop := 1 < n ∧ ¬ n.Prime

/-- A composite `n` with `∑_{i=1}^{n-1} i^φ(n) ≡ -1 (mod n)`. -/
def IsWeakGiuga (n : ℕ) : Prop :=
  Composite n ∧ n ∣ 1 + ∑ i ∈ Finset.Ioo 0 n, i ^ n.totient

/-- Every prime divisor `p` of `n` divides `n / p - 1`. -/
def PrimeDivisorCondition (n : ℕ) : Prop :=
  ∀ p ∈ n.primeFactors, p ∣ n / p - 1

/-- `∑_{p ∣ n} 1/p - 1/n` is a natural number. -/
def ReciprocalSumIsNat (n : ℕ) : Prop :=
  ∃ m : ℕ, ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = m

/-- Task `prime-divisor-condition`: Giuga's criterion. -/
def PrimeDivisorClaim : Prop :=
  ∀ {n : ℕ}, Composite n → (IsWeakGiuga n ↔ PrimeDivisorCondition n)

/-- Task `reciprocal-sum`: the prime divisor condition as a reciprocal sum. -/
def ReciprocalSumClaim : Prop :=
  ∀ {n : ℕ}, Composite n → (PrimeDivisorCondition n ↔ ReciprocalSumIsNat n)

end WeakGiuga
