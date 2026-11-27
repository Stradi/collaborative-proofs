# Pell counts on a circular board

Tile a labeled circle with squares in two colors and dominoes in one color. Counting by domino count gives a binomial sum. Counting by whether a domino crosses the clasp gives two Pell numbers.

Known written proof.

[Benjamin, Plott and Sellers, Lemma 7 and Theorem 8](https://math.hmc.edu/benjamin/wp-content/uploads/sites/5/2019/06/Tiling-Proofs-of-Recent-Sum-Identities-Involving-Pell-Numbers.pdf). The binomial summands use the two clasp cases directly, instead of the paper's rational coefficient.

## Proof tasks

- **Count tilings of a straight board**. Counts boards with a free clasp, where the circle can be cut into a line. With r dominoes the linear board has n−r tiles, of which r are dominoes. The n−2r squares each come in two colors. The total counts the Pell recurrence by considering the first tile.
- **Count the clasp-crossing tilings by domino count**. Relates the count on the remaining board to the count indexed by total dominoes, including the clasp domino. Remove the clasp domino from the n+2-cell circle. If the remaining board has r dominoes, the total was r+1, and the number of squares is unchanged. Simplify the two natural-number indices in each summand.
