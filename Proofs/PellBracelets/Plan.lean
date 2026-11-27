import Proofs.PellBracelets.Claims

namespace PellBracelets

theorem plan : StraightCountClaim → ClaspCountClaim → ProblemClaim := by
  intro straight clasp n
  rw [straight (n + 2), ← clasp n, straight n]

end PellBracelets
