import Proofs.PellOddIndexDivisibility.Claims

open scoped BigOperators

namespace PellOddIndexDivisibility

theorem plan : LastSquareClaim → MidpointClaim → ProblemClaim := by
  intro count cut n
  refine ⟨pell (n + 1) + pell n, ?_⟩
  have h := (count n).trans (cut n)
  omega

end PellOddIndexDivisibility
