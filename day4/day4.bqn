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

xmas ← ["M.S", ".A.", "M.S"]

#IsXmas ← {𝕩 = xmas}
IsXmas ← {5= +˝ +˘˝ 𝕩 = xmas}
Window ← {3‿3 ↕ 𝕩} 


Part1 ← {+´ Count¨ 𝕨 {𝕎𝕩}¨<𝕩}
Part2 ← {⊑ +˝+˝+˝ IsXmas⎉2 Window˘ ∘ >𝕨 {𝕎𝕩}¨<𝕩}
#Part2 ← {IsXmas⎉2 3‿3↕ 𝕨 {𝕎𝕩}¨<𝕩}
#Part2 ← {IsXmas⎉2 (3‿3 ↕𝕩)}
#•Show transforms Part1 matrix
#huh ← 3‿3 ↕matrix
#•Show (= xmas)⎉2 (3‿3 ↕matrix)
•Show ((↕4)⊏transforms) Part2 matrix

#•Show Count matrix
#•Show matrix
#•Show ⌽˘⍉ matrix
