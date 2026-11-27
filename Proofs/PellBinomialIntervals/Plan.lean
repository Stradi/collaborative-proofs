import Proofs.PellBinomialIntervals.Claims

open scoped BigOperators

namespace PellBinomialIntervals

theorem plan : EvenSubsetsClaim → PellNeighborsClaim → ProblemClaim := by
  intro subsets neighbors
  let count (n : ℕ) := ∑ r ∈ Finset.range ((n + 1) / 2 + 1), ((n + 1).choose (2 * r)) * 2 ^ r
  change ∀ n, count n = pell n + pell (n + 1)
  have agree (n : ℕ) : count n = pell n + pell (n + 1) ∧
      count (n + 1) = pell (n + 1) + pell (n + 2) := by
    induction n with
    | zero => constructor <;> decide
    | succ n ih =>
      refine ⟨ih.2, ?_⟩
      change count (n + 2) = pell (n + 2) + pell (n + 3)
      have step : count (n + 2) = 2 * count (n + 1) + count n := subsets n
      rw [step, ih.1, ih.2, ← neighbors n]
  exact fun n => (agree n).1

end PellBinomialIntervals
