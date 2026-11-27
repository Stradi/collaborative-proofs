import Proofs.BrocardRamanujan.Claims

namespace BrocardRamanujan

theorem plan : SmallCasesClaim → ConsecutiveFactorsClaim → FactorialObstructionClaim → ProblemClaim := by
  intro small factor exclude n m eq
  by_cases h : n < 8
  · exact small n m h eq
  · have large : 8 ≤ n := Nat.le_of_not_gt h
    obtain ⟨a, ha⟩ := factor n m large eq
    exact False.elim (exclude n a large ha)

end BrocardRamanujan
