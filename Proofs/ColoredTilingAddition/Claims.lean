import Mathlib.Tactic.Ring

namespace ColoredTilingAddition

/-- The number of tilings of a board with a square colors and b domino colors. -/
def tiles (a b : ℕ) : ℕ → ℕ
  | 0 => 1
  | 1 => a
  | n + 2 => a * tiles a b (n + 1) + b * tiles a b n

/-- Circular tilings indexed by length. -/
def bracelet (a b : ℕ) : ℕ → ℕ
  | 0 => 2
  | 1 => a
  | n + 2 => a * bracelet a b (n + 1) + b * bracelet a b n

/-- Two cuts for colored tilings. -/
def ProblemClaim : Prop :=
  ∀ a b m n : ℕ, 2 * tiles a b (m + n + 1) =
    bracelet a b (m + 1) * tiles a b n + bracelet a b (n + 1) * tiles a b m

/-- Split a row at a marked cut (task `line-cut`). -/
def LineCutClaim : Prop :=
  ∀ a b m n : ℕ, tiles a b (m + n + 1) =
    tiles a b (m + 1) * tiles a b n +
      (if n = 0 then 0 else b * tiles a b m * tiles a b (n - 1))

/-- Open a bracelet at the clasp (task `bracelet-cut`). -/
def BraceletCutClaim : Prop :=
  ∀ a b n : ℕ, bracelet a b (n + 1) =
    tiles a b (n + 1) + (if n = 0 then 0 else b * tiles a b (n - 1))

end ColoredTilingAddition
