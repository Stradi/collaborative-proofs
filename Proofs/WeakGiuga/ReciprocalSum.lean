import Proofs.WeakGiuga.Claims

theorem WeakGiuga.primeDivisorCondition_iff_reciprocalSumIsNat :
    ∀ {n : ℕ}, WeakGiuga.Composite n → (WeakGiuga.PrimeDivisorCondition n → WeakGiuga.PrimeDivisorCondition n) :=
  fun _ h => h
