# Weak Giuga numbers

For a composite `n`, `n` is a weak Giuga number, `∑_{i=1}^{n-1} i^φ(n) ≡ -1 (mod n)`, exactly when
`∑_{p ∣ n} 1/p - 1/n` is a natural number.

## Sources

- G. Giuga, *Su una presumibile proprietà caratteristica dei numeri primi*, Ist. Lombardo Sci.
  Lett. Rend. A 83 (1950), 511–528. Proves the criterion of task `prime-divisor-condition`.
- D. Borwein, J. M. Borwein, P. B. Borwein, R. Girgensohn, *Giuga's conjecture on primality*,
  Amer. Math. Monthly 103 (1996), 40–50, [doi:10.2307/2975213](https://doi.org/10.2307/2975213).
  Restates the criterion as the reciprocal sum of task `reciprocal-sum`.
- [Wikipedia: Giuga number](https://en.wikipedia.org/wiki/Giuga_number).
- Lean statement: Google DeepMind Formal Conjectures, `AgohGiuga.isWeakGiuga_iff_sum_primeFactors`
  in `FormalConjectures/Wikipedia/AgohGiuga.lean` at
  [`9097e2f`](https://github.com/google-deepmind/formal-conjectures/blob/9097e2f90e66d2f6244209cb1c07f7120d17ec53/FormalConjectures/Wikipedia/AgohGiuga.lean)
  (`research solved`, proof `sorry`). `IsWeakGiuga` is copied from there (Apache-2.0).

## Screening for an existing Lean proof (2026-11-26)

- Formal Conjectures: the statement ends in `sorry` and has no `formal_proof` link.
- Mathlib v4.36.0: no Giuga numbers.
- GitHub code search for `isWeakGiuga_iff_sum_primeFactors`, `IsWeakGiuga` and Lean files
  mentioning Giuga: only Formal Conjectures and its forks. The fork
  [`mo271/formal-conjectures@2663234`](https://github.com/mo271/formal-conjectures/blob/2663234a28260853790aa5752d8d4550ff0ab1ca/FormalConjectures/Wikipedia/AgohGiuga.lean#L97)
  proves `isWeakGiuga_iff_prime_dvd`, the claim of task `prime-divisor-condition`, not the problem.

## Frozen claim

`Challenges/WeakGiuga/Problem.lean`, over the approved definitions in
`Proofs/WeakGiuga/Claims.lean`:

```lean
theorem WeakGiuga.isWeakGiuga_iff_sum_primeFactors {n : ℕ} (hn : WeakGiuga.Composite n) :
    WeakGiuga.IsWeakGiuga n ↔ ∃ m : ℕ, ∑ p ∈ n.primeFactors, (1 / p : ℚ) - 1 / n = m
```

## Tasks

Each task proves one claim from `Claims.lean` in its own file and imports only Mathlib and the
claims module. Put helper lemmas in the task's namespace or mark them `private`.

| Task | Proof file | Theorem | Claim |
| --- | --- | --- | --- |
| `prime-divisor-condition` | `Proofs/WeakGiuga/PrimeDivisorCondition.lean` | `WeakGiuga.isWeakGiuga_iff_primeDivisorCondition` | `PrimeDivisorClaim` |
| `reciprocal-sum` | `Proofs/WeakGiuga/ReciprocalSum.lean` | `WeakGiuga.primeDivisorCondition_iff_reciprocalSumIsNat` | `ReciprocalSumClaim` |

**`prime-divisor-condition`**: for composite `n`, `IsWeakGiuga n ↔ ∀ p ∣ n prime, p ∣ n/p - 1`.
Fix a prime `q ∣ n`. Since `q - 1 = φ(q)` divides `φ(n)`, Fermat gives `i^φ(n) ≡ 1 (mod q)` when
`q ∤ i` and `i^φ(n) ≡ 0` otherwise. Of `1, …, n` exactly `n - n/q` are prime to `q`, and the term
`i = n` vanishes, so `1 + ∑_{i<n} i^φ(n) ≡ 1 - n/q (mod q)`. Hence `q` divides the sum exactly when
`q ∣ n/q - 1`. The forward direction follows. For the converse, `q² ∣ n` would give `q ∣ n/q` and
`q ∣ 1`, so `n` is squarefree and the product of its primes divides the sum.

**`reciprocal-sum`**: for composite `n`, `(∀ p ∣ n prime, p ∣ n/p - 1) ↔ ∑_{p ∣ n} 1/p - 1/n ∈ ℕ`.
Let `S = ∑_{p ∣ n} n/p`, so the sum equals `(S - 1)/n`. For a prime `q ∣ n`, every other term `n/p`
is divisible by `q`, so `S ≡ n/q (mod q)`. If `S - 1 = mn`, then `q ∣ S - 1`, so `q ∣ n/q - 1`.
Conversely the condition makes `n` squarefree as above and gives `q ∣ S - 1` for each `q`, so
`n ∣ S - 1`.

## Assembly plan

`Proofs/WeakGiuga/Plan.lean` proves the frozen claim from the two task claims by chaining the
equivalences. `Proofs/WeakGiuga/Solution.lean` applies it to the merged task theorems; check it with
`scripts/check-task weak-giuga`.
