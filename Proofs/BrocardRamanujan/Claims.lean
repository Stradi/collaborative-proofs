import Mathlib.Data.Nat.Factorial.Basic

namespace BrocardRamanujan

/-- Brocard–Ramanujan factorial squares. -/
def ProblemClaim : Prop :=
  ∀ n m : ℕ, Nat.factorial n + 1 = m ^ 2 →
    (n = 4 ∧ m = 5) ∨ (n = 5 ∧ m = 11) ∨ (n = 7 ∧ m = 71)

/-- Check the initial factorials (task `small-cases`). -/
def SmallCasesClaim : Prop :=
  ∀ n m : ℕ, n < 8 → Nat.factorial n + 1 = m ^ 2 →
    (n = 4 ∧ m = 5) ∨ (n = 5 ∧ m = 11) ∨ (n = 7 ∧ m = 71)

/-- Factor a hypothetical larger factorial (task `consecutive-factors`). -/
def ConsecutiveFactorsClaim : Prop :=
  ∀ n m : ℕ, 8 ≤ n → Nat.factorial n + 1 = m ^ 2 →
    ∃ a : ℕ, Nat.factorial n = 4 * (a * (a + 1))

/-- Exclude the remaining consecutive factorizations (task `factorial-obstruction`). -/
def FactorialObstructionClaim : Prop :=
  ∀ n a : ℕ, 8 ≤ n → Nat.factorial n ≠ 4 * (a * (a + 1))

end BrocardRamanujan
