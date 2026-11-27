import Proofs.ColoredDominoPrefix.Claims

open scoped BigOperators

namespace ColoredDominoPrefix

theorem plan : WeightedStepClaim → BoardStepClaim → ProblemClaim := by
  intro weighted board a b n
  induction n with
  | zero => simp [tiles, pow_succ] <;> ring
  | succ n ih =>
    change tiles a b (n + 3) = a ^ (n + 3) +
      b * ∑ k ∈ Finset.range (n + 2), tiles a b k * a ^ (n + 1 - k)
    rw [board a b (n + 1), ih, weighted, pow_succ]
    ring

end ColoredDominoPrefix
