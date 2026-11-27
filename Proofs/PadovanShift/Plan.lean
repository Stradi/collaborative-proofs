import Proofs.PadovanShift.Claims

namespace PadovanShift

theorem plan : LongShiftClaim → ShortShiftClaim → ProblemClaim := by
  intro long short n
  rw [long, Nat.add_assoc, short, ← Nat.add_assoc, ← Nat.two_mul]

end PadovanShift
