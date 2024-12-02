Parse ← ⊜(□ ⊜⋕ ≠ @ .)≠@\n .&fras

Sample ← Parse "day2/sample.txt"
Input  ← Parse "day2/input.txt"

# The levels are either all increasing or all decreasing.
# Any two adjacent levels differ by at least one and at most three.

Getpairs ← (
  .
  ≡⍚↘ 1
  :
  ≡⍚(⇌ ↘ 1 ⇌)
)

# Getpairs Sample

Diffs ← - Getpairs Input

Absdiffs ← ⌵ Diffs

Between ← (
  > 3 Absdiffs
  < 1 Absdiffs
  +
  ⍚/+
  = 0
)

# Between

Increasing ← =0 ⍚/+ ≤ 0 Diffs
Decreasing ← =0 ⍚/+ ≥ 0 Diffs

# Increasing
# Decreasing

Either ← + Increasing Decreasing
# Either

All ← = 2 + Either Between

# All

# part 1
°□/+ All
