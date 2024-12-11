in←•file.Lines "input.txt"

#•Show (2/≍≠⊑in) ⥊ in

# How can I remove the duplicate in? "Before"?
matrix ← (∘‿(≠⊑in)) ⥊ ∾in

#•Show matrix2
#•Show ≢ matrix

Count←{+´+˝ "XMAS" ⍷ 𝕩}
#Diag←>≠↑¨(+⌜´↕¨∘≢)⊸⊔

# I stole this and can barely even understand it without breaking it up!!!
DiagIndices ← (+⌜´↕¨∘≢)⊸⊔
Diag ← >≠↑¨ DiagIndices

# Diag = top right to bottom left
# ⌽˘Diag = bottom left to top right

transforms ← ⟨⊣,⌽˘,⍉,⌽˘⍉,Diag,⌽˘∘Diag,Diag⌽˘,⌽˘∘Diag⌽˘⟩
#transforms ← ⟨Diag⌽˘⟩

# show the transforms
#•Show transforms {𝕎𝕩}¨ <matrix

Part1 ← { +´ Count¨ 𝕨 {𝕎𝕩}¨<𝕩}
•Show transforms Part1 matrix

#•Show Count matrix
#•Show matrix
#•Show ⌽˘⍉ matrix
