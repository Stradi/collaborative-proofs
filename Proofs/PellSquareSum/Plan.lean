import Proofs.PellSquareSum.Claims

open scoped BigOperators

namespace PellSquareSum

theorem plan : PrefixSumClaim → SquareEndpointClaim → ProblemClaim := by
  intro prefixSum endpoint n
  refine ⟨pell (2 * n + 1) + pell (2 * n), ?_⟩
  have h := (prefixSum n).trans (endpoint n)
  omega

end PellSquareSum
