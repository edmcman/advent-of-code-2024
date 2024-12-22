Split ← ((⊢-˜+`×¬)∘=⊔⊢)
in ← •ParseFloat¨ ' ' Split ⊑•file.Lines "input.txt"

#If none of the other rules apply, the stone is replaced by a new stone; the old stone's number multiplied by 2024 is engraved on the new stone.
Digits ← 10{⌽𝕗|⌊∘÷⟜𝕗⍟(↕1+·⌊𝕗⋆⁼0.5+1⌈⊢)}

F ← {𝕊𝕩:
    # If the stone is engraved with the number 0, it is replaced by a stone
    # engraved with the number 1.
    (𝕩=0) ? ⋈1 ;
    #(𝕩=1) ? 5 ;
    # If the stone is engraved with a number that has an even number of digits, it is replaced by two stones. The left half of the digits are engraved on the new left stone, and the right half of the digits are engraved on the new right stone. (The new numbers don't keep extra leading zeroes: 1000 would become stones 10 and 0.)
    0=2 | ≠Digits 𝕩 ? (10⊸×⊸+˜´⌽)¨ ((2 ÷˜ ≠Digits 𝕩) (↑⋈↓) Digits 𝕩) ;
    ⋈ 𝕩 × 2024
}

part1 ← ≠ (∾´F¨)⍟25 in
# p2 too slow.  a fractal?
part2 ← ≠ (∾´F¨)⍟75 in