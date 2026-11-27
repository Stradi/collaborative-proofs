import Mathlib.Algebra.BigOperators.Ring.Finset

open scoped BigOperators

namespace PellOddIndexDivisibility

/-- The Pell numbers, starting with zero and one. -/
def pell : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

/-- A divisor of an odd-index Pell sum. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ, pell (n + 1) ∣ ∑ k ∈ Finset.range (n + 1), pell (2 * k + 1)

/-- Count by the last square (task `last-square`). -/
def LastSquareClaim : Prop :=
  ∀ n : ℕ, 2 * (∑ k ∈ Finset.range (n + 1), pell (2 * k + 1)) = pell (2 * n + 2)

/-- Cut the tiling at the midpoint (task `midpoint`). -/
def MidpointClaim : Prop :=
  ∀ n : ℕ, pell (2 * n + 2) = 2 * (pell (n + 1) * (pell (n + 1) + pell n))

end PellOddIndexDivisibility
