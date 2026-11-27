import Proofs.PellBracelets.Claims

open scoped BigOperators

namespace PellBracelets

theorem plan : StraightCountClaim → ClaspCountClaim → ProblemClaim := by
  intro straight clasp n
  rw [straight (n + 2), ← clasp n, straight n]

end PellBracelets
