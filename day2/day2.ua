Parse ← ⊜(□ ⊜⋕ ≠ @ .)≠@\n .&fras

Sample ← Parse "day2/sample.txt"
Input  ← Parse "day2/input.txt"

# The levels are either all increasing or all decreasing.
# Any two adjacent levels differ by at least one and at most three.

GetPairs ← (
  ◫ 2
)

GetDerivative ← ≡/- GetPairs

# Is array between [1,3]?
DerivativesAllBetween ← (
  .
  >3
  :
  <1
  +
  /+
  = 0
)

GetDerivative °□ ⊢ Sample

DerivativesIncreasing ← /↧ >0
DerivativesDecreasing ← DerivativesIncreasing ¯

⍤. = 1 DerivativesDecreasing [¯1 ¯2 ¯3]
⍤. = 0 DerivativesIncreasing [¯1 ¯2 ¯3]
⍤. = 1 DerivativesIncreasing [1]

⍤. = 1 DerivativesAllBetween [1 2 3]
⍤. = 0 DerivativesAllBetween [4 5 6]

AllBetween ← ⍚DerivativesAllBetween
⍤. = 1 ≍ {1 0} AllBetween {[1 2 3] [4 5 6]}

SteadyDerivative ← ↥ ⊃DerivativesIncreasing DerivativesDecreasing

CheckReport ← (
  GetDerivative
  /↧ [⊃(DerivativesAllBetween ⌵) SteadyDerivative]
)

Part₁ ← /+ ⍚CheckReport

Part₁ Sample
Part₁ Input

# Part 2

Remove₁ ← (
  .
  ⊞≠.⇡⧻ # Mask matrix
  ≡▽(⊙¤)
)

CheckReport₂ ← (
  Remove₁      # Remove 1, producing rows of possible reports
  ≡CheckReport # check each report
  /↥           # are any true?
)

CheckReport₃ ← /↥[⊃(CheckReport)(CheckReport₂)]

CheckReport₃ [1 2 3 4 5]

Part₂ ← /+ ⍚CheckReport₃
Part₂ Sample
Part₂ Input
