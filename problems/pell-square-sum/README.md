# Square sums of Pell numbers

Add the first 4n + 1 positive-index Pell numbers. The result is always a square, for example 1 + 2 + 5 + 12 + 29 = 49.

Known written proof.

[Benjamin, Plott and Sellers, Theorem 10](https://math.hmc.edu/benjamin/wp-content/uploads/sites/5/2019/06/Tiling-Proofs-of-Recent-Sum-Identities-Involving-Pell-Numbers.pdf). Their tiling bijection gives the square explicitly. The tasks use an algebraic route to the same identity.

## Proof tasks

- **Telescope the Pell prefix**. Expresses twice the target sum plus one in terms of its endpoints. Prove the identity first for an arbitrary prefix length m, with right side P(m+1) + P(m). On extending the prefix by one, the right side increases by 2P(m+1) by the Pell recurrence. The empty prefix gives 1 on both sides.
- **Identify the square at the endpoint**. Expresses the same endpoint expression using the proposed square root. Write Q(j) = P(j+1) − P(j) over the integers. The recurrence gives Q(j+1) = Q(j) + 2P(j) and P(j+1) = Q(j) + P(j). By induction on j, Q(j)^2 − 2P(j)^2 = (−1)^j. The same recurrences give Q(2j) = Q(j)^2 + 2P(j)^2 by multiplication of Q + P√2. Hence Q(4n+2) = 2Q(2n+1)^2 + 1. Use P(j+2) − P(j+1) = P(j+1) + P(j) to translate back.
