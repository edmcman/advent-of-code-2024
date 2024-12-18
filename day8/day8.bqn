in ← >•file.Lines "input.txt"

#FreqsOrig ← {⍷('.'≠⥊𝕩) / ⥊𝕩}
Freqs ← ('.'⊸≠(⍷∘/)⊢)⥊

#freqs ← Freqs in

GetIndices ← /○⥊⟜(↕≢)

#ExtendOrig ← {𝕩+(𝕩-𝕨)}
Extend ← ⊣+-

#•Show Freqs in

OnGrid ⇐ ∧´(≥⟜0)∾<⟜(≢⊢)

GetNonDiag ← ≠⌜˜∘↕∘≠/○⥊⊢

# todo rewrite this
# todo take in as argument
FreqHelperOrig ← {(OnGrid⟜in)¨⊸/ GetNonDiag Extend⌜˜ GetIndices (in=𝕩)}
FreqHelperTest ←  GetNonDiag∘Extend⌜˜∘GetIndices∘=

part1 ← ≠ ⍷∾´ FreqHelper¨ Freqs in
•Show part1