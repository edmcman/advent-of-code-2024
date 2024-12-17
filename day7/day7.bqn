in ← •file.Lines "input.txt"

Split ← ((⊢-˜+`×¬)∘=⊔⊢)
ParseInt ← (10⊸×⊸+˜´∘⌽-⟜'0')

Parse ← >{a‿b ← ':'⊸Split 𝕩⋄⟨ParseInt a, ParseInt¨ 1↓(' 'Split b)⟩}¨

#•Show Parse in


# 𝕨 is a list of left operands
# 𝕩 is a right operand
# return all possible combinations of + and *
SpecialFold ← +∾×

Part1 ← +´ { a‿bs ← 𝕩 ⋄ a×∨´ a=SpecialFold´ ⌽bs }˘

•Show Part1 Parse in

Concat ← ⊢+⊣×(10⊸⋆(⌊1+10⋆⁼⊢))
#Concat ← ⊢+⊣×(10⊸⋆(⌊1⊸+10⊸⋆⁼))

SpecialFold2 ← Concat˜∾+∾×

Part2 ← +´ { a‿bs ← 𝕩 ⋄ a×∨´ a=SpecialFold2´ ⌽bs }˘

•Show Part2 Parse in