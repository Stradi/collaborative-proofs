import Proofs.WeakGiuga.Claims
import Mathlib.Data.Nat.Squarefree
import Mathlib.Algebra.BigOperators.Associated
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

namespace WeakGiuga.ReciprocalSum

open Finset

private lemma dvd_div_of_ne {n p q : ℕ} (hp : p ∈ n.primeFactors) (hq : q ∈ n.primeFactors)
    (hpq : p ≠ q) : q ∣ n / p := by
  have hqp := Nat.prime_of_mem_primeFactors hq
  have : q ∣ p * (n / p) := by rw [Nat.mul_div_cancel' (Nat.dvd_of_mem_primeFactors hp)]; exact Nat.dvd_of_mem_primeFactors hq
  rcases (Nat.Prime.dvd_mul hqp).1 this with h | h
  · exact absurd ((Nat.prime_dvd_prime_iff_eq hqp (Nat.prime_of_mem_primeFactors hp)).1 h) (Ne.symm hpq)
  · exact h

private lemma sum_modEq {n q : ℕ} (hq : q ∈ n.primeFactors) :
    ∑ p ∈ n.primeFactors, n / p ≡ n / q [MOD q] := by
  rw [← add_sum_erase _ _ hq]
  have hR : q ∣ ∑ p ∈ n.primeFactors.erase q, n / p :=
    dvd_sum fun p hp => dvd_div_of_ne (mem_of_mem_erase hp) hq (ne_of_mem_erase hp)
  simpa using (Nat.modEq_zero_iff_dvd.2 hR).add_left (n / q)

private lemma one_le_div {n q : ℕ} (hn : n ≠ 0) (hq : q ∈ n.primeFactors) : 1 ≤ n / q :=
  Nat.div_pos (Nat.le_of_dvd (Nat.pos_of_ne_zero hn) (Nat.dvd_of_mem_primeFactors hq))
    (Nat.prime_of_mem_primeFactors hq).pos

private lemma sum_reciprocal_eq {n : ℕ} (hn : n ≠ 0) :
    ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = ((∑ p ∈ n.primeFactors, n / p : ℕ) - 1) / n := by
  have hn' : (n : ℚ) ≠ 0 := by exact_mod_cast hn
  rw [sub_div, Nat.cast_sum, sum_div]
  congr 1
  refine sum_congr rfl fun p hp => ?_
  have hp0 : (p : ℚ) ≠ 0 := by exact_mod_cast (Nat.prime_of_mem_primeFactors hp).ne_zero
  rw [Nat.cast_div (Nat.dvd_of_mem_primeFactors hp) hp0]
  field_simp

end WeakGiuga.ReciprocalSum

open WeakGiuga.ReciprocalSum in
theorem WeakGiuga.primeDivisorCondition_iff_reciprocalSumIsNat :
    WeakGiuga.ReciprocalSumClaim := by
  intro n hn
  have hn0 : n ≠ 0 := by have := hn.1; omega
  have hn' : (n : ℚ) ≠ 0 := by exact_mod_cast hn0
  set S := ∑ p ∈ n.primeFactors, n / p with hS
  obtain ⟨q₀, hq₀⟩ := Nat.nonempty_primeFactors.2 hn.1
  have hS1 : 1 ≤ S :=
    (one_le_div hn0 hq₀).trans (Finset.single_le_sum (fun _ _ => Nat.zero_le _) hq₀)
  unfold WeakGiuga.PrimeDivisorCondition WeakGiuga.ReciprocalSumIsNat
  rw [sum_reciprocal_eq hn0]
  constructor
  · intro h
    have hsq : Squarefree n := by
      rw [Nat.squarefree_iff_prime_squarefree]
      intro q hq hqq
      have hqP : q ∈ n.primeFactors :=
        Nat.mem_primeFactors.2 ⟨hq, dvd_trans (dvd_mul_right q q) hqq, hn0⟩
      have h1 : q ∣ n / q := Nat.dvd_div_of_mul_dvd hqq
      have h2 : q ∣ n / q - (n / q - 1) := Nat.dvd_sub h1 (h q hqP)
      rw [Nat.sub_sub_self (one_le_div hn0 hqP)] at h2
      exact hq.one_lt.ne' (Nat.dvd_one.1 h2)
    have hdvd : ∀ q ∈ n.primeFactors, q ∣ S - 1 := by
      intro q hq
      have h1 : n / q ≡ 1 [MOD q] := ((Nat.modEq_iff_dvd' (one_le_div hn0 hq)).2 (h q hq)).symm
      exact (Nat.modEq_iff_dvd' hS1).1 ((sum_modEq hq).trans h1).symm
    have hnS : n ∣ S - 1 := by
      have := Finset.prod_primes_dvd (S - 1)
        (fun q hq => (Nat.prime_of_mem_primeFactors hq).prime) hdvd
      rwa [Nat.prod_primeFactors_of_squarefree hsq] at this
    obtain ⟨m, hm⟩ := hnS
    refine ⟨m, ?_⟩
    have hcast : ((S - 1 : ℕ) : ℚ) = n * m := by exact_mod_cast hm
    rw [Nat.cast_sub hS1, Nat.cast_one] at hcast
    rw [hcast]
    field_simp
  · rintro ⟨m, hm⟩ q hq
    rw [div_eq_iff hn'] at hm
    have hSn : S = m * n + 1 := by
      have : (S : ℚ) = m * n + 1 := by linarith
      exact_mod_cast this
    have h1 : S ≡ 1 [MOD q] := by
      have hq' : q ∣ m * n := dvd_mul_of_dvd_right (Nat.dvd_of_mem_primeFactors hq) m
      rw [hSn]
      simpa using (Nat.modEq_zero_iff_dvd.2 hq').add_right 1
    exact (Nat.modEq_iff_dvd' (one_le_div hn0 hq)).1 ((sum_modEq hq).symm.trans h1).symm
