import Mathlib.Algebra.BigOperators.Ring.Finset

open scoped BigOperators

namespace PellSquareSum

/-- The Pell numbers, starting with zero and one. -/
def pell : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

/-- Square sums of Pell numbers. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ, ∃ r : ℕ, (∑ k ∈ Finset.range (4 * n + 1), pell (k + 1)) = r ^ 2

/-- Telescope the Pell prefix (task `prefix-sum`). -/
def PrefixSumClaim : Prop :=
  ∀ n : ℕ, 2 * (∑ k ∈ Finset.range (4 * n + 1), pell (k + 1)) + 1 =
    pell (4 * n + 2) + pell (4 * n + 1)

/-- Identify the square at the endpoint (task `square-endpoint`). -/
def SquareEndpointClaim : Prop :=
  ∀ n : ℕ, pell (4 * n + 2) + pell (4 * n + 1) =
    2 * (pell (2 * n + 1) + pell (2 * n)) ^ 2 + 1

end PellSquareSum
