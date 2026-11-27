# Brocard–Ramanujan factorial squares

The numbers 4! + 1, 5! + 1, and 7! + 1 are squares. Do these examples exhaust all natural numbers n for which n! + 1 is a square?

Open problem. The unbounded obstruction task asks for the part that remains unresolved.

[Berndt and Galway, On the Brocard–Ramanujan Diophantine Equation](https://doi.org/10.1023/A:1009873805276). For recent progress on counting possible solutions, see [Bui, Pratt and Zaharescu](https://arxiv.org/abs/2204.08423).

## Proof tasks

- **Check the initial factorials**. Classifies all solutions through n=7. Evaluate n! + 1 for n=0 through 7. The values 25, 121 and 5041 are the three exact squares. Put each other value strictly between consecutive squares and use monotonicity on the naturals.
- **Factor a hypothetical larger factorial**. Turns the square equation into a product of consecutive factors. For n≥8 the factorial is even, so m is odd. Write m=2a+1 and expand m²−1=4a(a+1). This formulation is equivalent to the square equation in the larger range.
- **Exclude the remaining consecutive factorizations**. Would rule out a fourth pair. This is the open step. Since a and a+1 are coprime, each prime-power block of n!/4 lies entirely on one side. Try to rule out partitions into consecutive products. A modular sieve can rule out ranges but does not give an unbounded proof on its own.
