# Tilings with at least one colored domino

Separate the all-square tilings of a row from the tilings containing a domino. Choosing the first domino gives a weighted sum for the second class, for any number of square and domino colors.

Known written proof.

[Belbachir and Belkhir, equation (2.1)](https://publikacio.uni-eszterhazy.hu/2716/1/AMI_41_from13to17.pdf). The rightmost domino cuts off an all-square suffix.

## Proof tasks

- **Extend the weighted sum**. Gives the recurrence of the sum after adding one cell. Split off the last term with Finset.sum_range_succ. For every remaining index k ≤ n, the exponent increases by one, so an extra factor a can be taken out of the sum.
- **Separate the first domino from the square prefix**. Identifies each step of the board count used in the assembly induction. A first square uses one of a colors, and a first domino uses one of b colors. The remaining board gives the two terms. The same relation is the defining recurrence, so unfolding tiles once verifies it.
