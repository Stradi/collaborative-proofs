import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset

open scoped BigOperators

namespace ErdosMoser

/-- Sum all kth powers from zero up to, but excluding, m. -/
def powerSum (k m : ℕ) : ℕ :=
  ∑ i ∈ Finset.range m, i ^ k

/-- The prime divisors of Moser's four neighboring numbers constrain the exponent. -/
def MoserPrimeDivisors (k m : ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → (p ∣ m - 1 ∨ p ∣ m + 1 ∨ p ∣ 2 * m - 1 ∨ p ∣ 2 * m + 1) → p - 1 ∣ k

/-- The even-exponent Erdős–Moser equation. -/
def ProblemClaim : Prop :=
  ∀ k m : ℕ, 2 ≤ k → Even k → 2 ≤ m → powerSum k m ≠ m ^ k

/-- Restrict the base of a hypothetical solution (task `moser-restriction`). -/
def MoserRestrictionClaim : Prop :=
  ∀ k m : ℕ, 2 ≤ k → Even k → 2 ≤ m → powerSum k m = m ^ k →
    3 < m ∧ m % 8 = 3

/-- Restrict the exponent using the prime divisors (task `prime-restrictions`). -/
def PrimeRestrictionsClaim : Prop :=
  ∀ k m : ℕ, 2 ≤ k → Even k → 2 ≤ m → powerSum k m = m ^ k → MoserPrimeDivisors k m

/-- Exclude solutions in the remaining residue class (task `restricted-obstruction`). -/
def RestrictedObstructionClaim : Prop :=
  ∀ k m : ℕ, 2 ≤ k → Even k → 3 < m → m % 8 = 3 → MoserPrimeDivisors k m → powerSum k m ≠ m ^ k

end ErdosMoser
