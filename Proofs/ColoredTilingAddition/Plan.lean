import Mathlib.Tactic.Ring
import Proofs.ColoredTilingAddition.Claims

namespace ColoredTilingAddition

theorem plan : LineCutClaim → BraceletCutClaim → ProblemClaim := by
  intro line circle a b m n
  have left := line a b m n
  have right := line a b n m
  rw [Nat.add_comm n m] at right
  rw [circle a b m, circle a b n, Nat.two_mul]
  calc
    _ = _ := congrArg₂ (· + ·) left right
    _ = _ := by
      by_cases hm : m = 0 <;> by_cases hn : n = 0 <;>
        simp only [hm, hn, if_true, if_false] <;> ring

end ColoredTilingAddition
