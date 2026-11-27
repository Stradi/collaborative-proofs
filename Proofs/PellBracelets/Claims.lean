import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Nat.Choose.Basic

open scoped BigOperators

namespace PellBracelets

/-- The Pell numbers, starting with zero and one. -/
def pell : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

/-- Pell counts on a circular board. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ,
    (∑ r ∈ Finset.range ((n + 2) / 2 + 1), ((n + 2 - r).choose r) * 2 ^ (n + 2 - 2 * r)) +
    (∑ r ∈ Finset.range (n / 2 + 1), ((n + 2 - (r + 1) - 1).choose r) * 2 ^ (n + 2 - 2 * (r + 1))) =
    pell (n + 3) + pell (n + 1)

/-- Count tilings of a straight board (task `straight-count`). -/
def StraightCountClaim : Prop :=
  ∀ n : ℕ, (∑ r ∈ Finset.range (n / 2 + 1), ((n - r).choose r) * 2 ^ (n - 2 * r)) = pell (n + 1)

/-- Count the clasp-crossing tilings by domino count (task `clasp-count`). -/
def ClaspCountClaim : Prop :=
  ∀ n : ℕ, (∑ r ∈ Finset.range (n / 2 + 1), ((n - r).choose r) * 2 ^ (n - 2 * r)) =
    ∑ r ∈ Finset.range (n / 2 + 1), ((n + 2 - (r + 1) - 1).choose r) * 2 ^ (n + 2 - 2 * (r + 1))

end PellBracelets
