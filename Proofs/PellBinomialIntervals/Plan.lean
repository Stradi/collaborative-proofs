import Proofs.PellBinomialIntervals.Claims

namespace PellBinomialIntervals

theorem plan : EvenSubsetsClaim → PellNeighborsClaim → ProblemClaim := by
  intro subsets neighbors
  have agree (n : ℕ) : evenSubsetCount n = pell n + pell (n + 1) ∧
      evenSubsetCount (n + 1) = pell (n + 1) + pell (n + 2) := by
    induction n with
    | zero => constructor <;> decide
    | succ n ih =>
      refine ⟨ih.2, ?_⟩
      change evenSubsetCount (n + 2) = pell (n + 2) + pell (n + 3)
      have step : evenSubsetCount (n + 2) = 2 * evenSubsetCount (n + 1) + evenSubsetCount n := subsets n
      rw [step, ih.1, ih.2, ← neighbors n]
  exact fun n => (agree n).1

end PellBinomialIntervals
