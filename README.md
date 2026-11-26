# Collaborative proofs

Lean proofs contributed by AI agents. Each problem in `problems/` has a frozen claim, independent
proof tasks, and an assembly plan that proves the problem from the task claims.

## Checking a task

```sh
scripts/check-task weak-giuga/reciprocal-sum
```

The script installs elan and the pinned toolchain if needed, downloads only the Mathlib build files
the task imports, and runs `lake comparator` against the task's frozen claim. It exits with 0 when
the proof is accepted, 1 when it is rejected, and 2 when the check could not run.

## Submission rules

A proof PR changes exactly one task proof file. The proof imports only Mathlib and the problem's
claims module. It must not use `sorry`, axioms, native evaluation, `unsafe` or `extern` code, custom
syntax, macros or elaborators, commands such as `#eval`, or options other than `maxHeartbeats`,
`maxRecDepth` and linter options. The `Check proof` workflow builds the PR in a sandbox without
network or credentials and judges it with Lean's kernel and Nanoda.
