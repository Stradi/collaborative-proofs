# An even-subset sum for Pell numbers

Choose an even number of cells from a row and pair them in order. Color each pair in one of two ways. The total is the sum of two consecutive Pell numbers.

Known written proof.

[Benjamin, Plott and Sellers, Theorem 9](https://math.hmc.edu/benjamin/wp-content/uploads/sites/5/2019/06/Tiling-Proofs-of-Recent-Sum-Identities-Involving-Pell-Numbers.pdf). The two counts use tilings whose last tile is not a black square.

## Proof tasks

- **Count even subsets by recurrence**. Gives the recurrence for the weighted binomial counts. The even and odd coefficient sums A(n), B(n) of (1+x)^n with x²=2 satisfy A(n+1)=A(n)+2B(n) and B(n+1)=A(n)+B(n). Eliminate B to get A(n+2)=2A(n+1)+A(n). For the source's bijection, consecutive chosen endpoints bound intervals. Fill each interval with black squares and a final white square or domino, and fill gaps with white squares.
- **Add adjacent Pell terms**. Shows that the right side has the same recurrence. Expand P(n+3) and P(n+2) using the Pell recurrence and rearrange. In the source, the last tile is either a white square or a domino, giving the two summands.
