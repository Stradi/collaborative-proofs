import Mathlib.Algebra.Ring.Nat

namespace PadovanShift

/-- Domino and tromino tiling counts indexed by board length. -/
def tilings : ℕ → ℕ
  | 0 => 1
  | 1 => 0
  | 2 => 1
  | n + 3 => tilings (n + 1) + tilings n

/-- A six-step Padovan identity. -/
def ProblemClaim : Prop :=
  ∀ n : ℕ, tilings (n + 7) + tilings (n + 3) = 2 * tilings (n + 5) + tilings (n + 1)

/-- Split the longer board (task `long-shift`). -/
def LongShiftClaim : Prop :=
  ∀ n : ℕ, tilings (n + 7) = tilings (n + 5) + tilings (n + 4)

/-- Compare the middle and shorter boards (task `short-shift`). -/
def ShortShiftClaim : Prop :=
  ∀ n : ℕ, tilings (n + 4) + tilings (n + 3) = tilings (n + 5) + tilings (n + 1)

end PadovanShift
