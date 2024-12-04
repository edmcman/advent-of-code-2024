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

# Part 2.  At a high level we want to mask out stuff between do() and don't().
# How do we do that?

Sample₂ ← $ xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))

DontMask ← (⌕ "don't()")
DoMask   ← (⌕ "do()")

# Pick a mask based on state. 1=Do 0=Dont
# PickAMask ← ⊡:[⊃DontMask DoMask] :

# PickAMask Sample 0

# OK, as a warm up, let's just maintain the state saying whether we're in a do() or don't() block.

# First arg is the new element, second is accumulator

# DumbIdentity 4

# Idea: We'll combine the string, domask, and dontmask into a 3xlen matrix.  Then we'll fold over that matrix.

BuildMatrix ← ⍉ [⊃DontMask DoMask]

# (fun newarray accumulator =>
#  let hd = accumulator.head() in
#  newarray[not hd] xor hd::accumulator)

FoldFun ← (
  ⊢,    # get hd
  ⟜(⊡¬) # pick "not hd" while preserving hd
  ⊂≠    # xor, and join
)

# ⊂
# $savedacclist .
# args are new element, accumulator
# $accumscalar ⊢: # save the accumulator for later.
# ?
# if accumulator is 1 (do) get the dont mask, else get the do mask
# pick the new element from the proper mask but keep the old state
# ⟜⊡
# ?
# now the accumulator is top, and then the mask element
# we want mask | accum | not accum
# $itearray ⊟ ¬.:
# now if the element is 1, we need to switch our state, and if it's 0, we don't.
# ?
# $newaccscalar ⊡:
# ?
# ◌

# Test 1: in Do mode, didn't find don't.  Should stay in Do mode.
⍤. ≍ [1 1 1 1 0] FoldFun [0 0] [1 1 1 0]
# Test 2: in Do mode, found don't.  Should switch to don't mode.
⍤. ≍ [0 1 1 1 0] FoldFun [1 0] [1 1 1 0]

# BuildMatrix Sample₂

# BuildMatrix Sample₂

MkMask ← ⇌ ∧FoldFun : [1] BuildMatrix
MkMask Sample₂

GetMaskedText ← ▽ MkMask .
GetMaskedText Sample₂

Part₂ ← Part₁ GetMaskedText
Part₂ Sample₂

Part₂ Input
