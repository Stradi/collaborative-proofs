# A divisor of an odd-index Pell sum

Sum the first n + 1 odd-index Pell numbers. The Pell number at index n + 1 divides this sum.

Known written proof.

[Benjamin, Plott and Sellers, Lemma 5 and Theorem 6](https://math.hmc.edu/benjamin/wp-content/uploads/sites/5/2019/06/Tiling-Proofs-of-Recent-Sum-Identities-Involving-Pell-Numbers.pdf). The proof partitions tilings of a board by the last square and by whether a domino crosses a fixed cut.

## Proof tasks

- **Count by the last square**. Turns the sum into half of a single Pell number. A board of odd length 2n+1 must contain a square. Its last square is in cell 2k+1, has two colors, and is followed solely by dominoes. The prefix contributes P(2k+1). Alternatively, apply the recurrence P(j+2) = 2P(j+1) + P(j) and telescope the even indices.
- **Cut the tiling at the midpoint**. Provides an explicit multiple of twice the required divisor. Cut the length-2n+1 board after n cells. A clean cut contributes P(n+1)P(n+2). A crossing domino contributes P(n)P(n+1), which is zero at n = 0. Add the terms and use P(n+2) = 2P(n+1) + P(n).
