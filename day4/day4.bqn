in←•file.Lines "sample.txt"

#•Show (2/≍≠⊑in) ⥊ in

# How can I remove the duplicate in? "Before"?
matrix ← (∘‿(≠⊑in)) ⥊ ∾in

#•Show matrix2
•Show ≢ matrix

Count←{+´+˝ "XMAS" ⍷ 𝕩}
#Diag←>≠↑¨(+⌜´↕¨∘≢)⊸⊔

# I stole this and can barely even understand it without breaking it up!!!
DiagIndices ← (+⌜´↕¨∘≢)⊸⊔
Diag ← >≠↑¨ DiagIndices

transforms ← ⟨⊣,⌽˘,⍉,⌽⍉,Diag,⌽˘Diag,⍉Diag,⌽∘⍉Diag⟩

# show the transforms
#•Show transforms {𝕎𝕩}¨ <matrix

Test ← {+´ Count¨ 𝕨 {𝕎𝕩}¨<𝕩}
•Show transforms Test matrix

#•Show Count matrix
#•Show matrix
#•Show ⌽˘⍉ matrix
