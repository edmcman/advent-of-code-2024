Sample ← $ xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
Input  ← &fras "day3/input.txt"

# mul(X,Y), where X and Y are each 1-3 digit numbers

Regex ← regex "mul\\((\\d{1,3}),(\\d{1,3})\\)"
Part₁ ← /+≡(
  ↘1 # Drop the "full" regex capture
  ⋕  # Parse the arguments
  /× # Multiply them
) Regex

# Part₁ Sample
Part₁ Input
