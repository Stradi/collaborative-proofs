import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Nat.Choose.Basic

open scoped BigOperators

namespace PellBinomialIntervals

/-- The Pell numbers, starting with zero and one. -/
def pell : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

/-- Weighted count of even subsets of an n + 1 cell row. -/
def evenSubsetCount (n : ℕ) : ℕ :=
  ∑ r ∈ Finset.range ((n + 1) / 2 + 1), (n + 1).choose (2 * r) * 2 ^ r

/-- An even-subset sum for Pell numbers. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ, evenSubsetCount n = pell n + pell (n + 1)

/-- Count even subsets by recurrence (task `even-subsets`). -/
def EvenSubsetsClaim : Prop :=
  ∀ n : ℕ, evenSubsetCount (n + 2) = 2 * evenSubsetCount (n + 1) + evenSubsetCount n

/-- Add adjacent Pell terms (task `pell-neighbors`). -/
def PellNeighborsClaim : Prop :=
  ∀ n : ℕ, pell (n + 2) + pell (n + 3) =
    2 * (pell (n + 1) + pell (n + 2)) + (pell n + pell (n + 1))

end PellBinomialIntervals
