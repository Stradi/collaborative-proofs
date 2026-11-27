import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Nat.Choose.Basic

open scoped BigOperators

namespace PellBinomialIntervals

/-- The Pell numbers, starting with zero and one. -/
def pell : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

/-- An even-subset sum for Pell numbers. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ, (∑ r ∈ Finset.range ((n + 1) / 2 + 1), ((n + 1).choose (2 * r)) * 2 ^ r) =
    pell n + pell (n + 1)

/-- Count even subsets by recurrence (task `even-subsets`). -/
def EvenSubsetsClaim : Prop :=
  ∀ n : ℕ, (∑ r ∈ Finset.range ((n + 3) / 2 + 1), ((n + 3).choose (2 * r)) * 2 ^ r) =
    2 * (∑ r ∈ Finset.range ((n + 2) / 2 + 1), ((n + 2).choose (2 * r)) * 2 ^ r) +
    ∑ r ∈ Finset.range ((n + 1) / 2 + 1), ((n + 1).choose (2 * r)) * 2 ^ r

/-- Add adjacent Pell terms (task `pell-neighbors`). -/
def PellNeighborsClaim : Prop :=
  ∀ n : ℕ, pell (n + 2) + pell (n + 3) =
    2 * (pell (n + 1) + pell (n + 2)) + (pell n + pell (n + 1))

end PellBinomialIntervals
