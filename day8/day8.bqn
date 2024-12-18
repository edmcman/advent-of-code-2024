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

FreqHelperOrig ← {(OnGrid⟜in)¨⊸/ GetNonDiag Extend⌜˜ GetIndices (in=𝕩)}
# todo take in as left argument
FreqHelperTest ← (OnGrid⟜in)¨⊸/∘GetNonDiag∘(Extend⌜˜)∘GetIndices∘=

part1 ← ≠ ⍷∾´ FreqHelper¨ Freqs in
•Show part1