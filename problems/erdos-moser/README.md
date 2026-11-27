# The even-exponent Erdős–Moser equation

Can a positive even power ever equal the sum of all smaller nonnegative integers raised to the same power? Ruling this out would settle the remaining case of the Erdős–Moser conjecture.

Open problem. The last task needs an unconditional obstruction beyond the published bounds.

[Moree, Moser’s mathemagical work, Sections 2 and 4](https://arxiv.org/abs/1011.2940). Moser obtained congruences and a lower bound for a hypothetical solution. [An existing Lean project](https://github.com/BrettKnox/open-problems-lab) covers the odd case. This problem asks for the unresolved even case.

## Proof tasks

- **Restrict the base of a hypothetical solution**. Isolates the residue class in which an even-exponent solution could occur. Use Moree's proof of Moser's theorem. Compare the sum and m^k modulo 4 to restrict m modulo 8. For an even m, grouping the sum into blocks modulo its exact power of two gives a nonzero residue, contradicting m^k. Handle m=3 separately using 1+2^k < 3^k for k≥2.
- **Exclude solutions in the remaining residue class**. Would rule out every candidate left by Moser's restriction. This is the open step. Start from the congruences for prime divisors of m−1, m+1, 2m−1 and 2m+1 in Moree. They constrain the exponent and the reciprocal sums but yield finite lower bounds. A contradiction has to cover arbitrarily large m. Record any narrower provable claim in a give-up report.
