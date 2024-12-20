in ← >•file.Lines "input.txt"

#FreqsOrig ← {⍷('.'≠⥊𝕩) / ⥊𝕩}
Freqs ← ('.'⊸≠(⍷∘/)⊢)⥊

#freqs ← Freqs in

GetIndices ← /○⥊⟜(↕≢)

#ExtendOrig ← {𝕩+(𝕩-𝕨)}
Extend ← ⊣+-

OnGrid ⇐ ∧´(≥⟜0)∾<⟜(≢⊢)

GetNonDiag ← ≠⌜˜∘↕∘≠/○⥊⊢

#FreqHelperOrig ← {(OnGrid⟜in)¨⊸/ GetNonDiag Extend⌜˜ GetIndices (in=𝕩)}
# todo take in as left argument
FreqHelper ← {grid S 𝕩: (OnGrid⟜grid)¨⊸/∘GetNonDiag(Extend⌜˜)GetIndices(grid⊸=) 𝕩}

part1 ← ≠ ⍷∾´ (in⊸FreqHelper)¨ Freqs in
•Show part1

# ok take the difference from 𝕩. as we go in that (forward) direction, which
# will go out of bounds first, the x axis or y axis?

# let's be dumber.  we'll take grid.width / delta.x and grid.height / delta.y,
# and take the maximum.
ExtendPartTwo ← {
    diff ← 𝕨 - 𝕩
    #•Show diff
    n ← 𝕨 (⌈ ∘ ⌊´|¨ ∘((≢in)⊸÷-)) 𝕩
    #•Show n
    𝕨 {n≡∞ ? ⟨⟩ ; (<𝕨) +¨ (<diff) ×¨ ↕(n+1)} 𝕩
    
}

P2FreqHelper ← (OnGrid⟜in)¨⊸/∘ ∾´⥊∘(ExtendPartTwo⌜˜)∘GetIndices∘(in⊸=)
#P2FreqHelper ← (OnGrid⟜in)¨⊸/∘∾´⥊ in (ExtendPartTwo⌜˜)∘GetIndices∘=
part2 ← ≠ ⍷∾´ ((<in)⊸P2FreqHelper)¨ Freqs in
•Show part2