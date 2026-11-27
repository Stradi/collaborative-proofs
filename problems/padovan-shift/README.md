# A six-step Padovan identity

The Padovan numbers count tilings by dominoes and trominoes. A second recurrence uses only earlier terms of the same index parity.

Known written proof.

[Tedford, Combinatorial Identities, Identity 3.4](https://www.fq.math.ca/Papers/57-4/tedford06222019.pdf). The paper groups tilings by their initial tiles. The Lean tasks use two shifts of the same counting argument.

## Proof tasks

- **Split the longer board**. Expands the term of length n+7 by its possible first tiles. Drop a first domino or a first tromino. These are disjoint and give the two shorter board lengths named in the claim.
- **Compare the middle and shorter boards**. Replaces the leftover sum after splitting the longer board. Expand all of P(n+4), P(n+3), and P(n+5) by their possible first tiles. The two sides reorganize the same four shorter counts, with P(n+3) itself expanded once more on the right.
