import Mathlib.Algebra.BigOperators.Ring.Finset

open scoped BigOperators

namespace ColoredDominoPrefix

/-- The number of tilings of a board with a square colors and b domino colors. -/
def tiles (a b : ℕ) : ℕ → ℕ
  | 0 => 1
  | 1 => a
  | n + 2 => a * tiles a b (n + 1) + b * tiles a b n

/-- Tilings with at least one colored domino. -/
def ProblemClaim : Prop :=
  ∀ a b n : ℕ, tiles a b (n + 2) = a ^ (n + 2) +
    b * ∑ k ∈ Finset.range (n + 1), tiles a b k * a ^ (n - k)

/-- Extend the weighted sum (task `weighted-step`). -/
def WeightedStepClaim : Prop :=
  ∀ a b n : ℕ, (∑ k ∈ Finset.range (n + 2), tiles a b k * a ^ (n + 1 - k)) =
    a * (∑ k ∈ Finset.range (n + 1), tiles a b k * a ^ (n - k)) + tiles a b (n + 1)

/-- Split on the first tile (task `board-step`). -/
def BoardStepClaim : Prop :=
  ∀ a b n : ℕ, tiles a b (n + 2) = a * tiles a b (n + 1) + b * tiles a b n

end ColoredDominoPrefix
