in ← '0'-˜⊑•file.Lines "input.txt"

blockends ← +` in
blockstarts ← 0∾¯1↓blockends


files‿frees ←  ((⊏⊢)⋈(¯1↓1⊏⊢)) (⍉(∘‿2 ⥊ in∾¯1))

mat ← ∘‿2 ⥊ in∾0

# first column is block #
# second column is block size
# third column is free size
matplusplus ← ⍉(1‿(≠mat)⥊(↕≠mat))∾⍉mat

#freespaces ← +´ 2⊏⍉matplusplus

# Now we need to know the last freespaces blocks.

Repeat ← {𝕨/[𝕩]}

FoldCell ← {<((1⊑𝕩) Repeat ⊑𝕩) ∾ ((2⊑𝕩) Repeat '.')}

#•Show matplusplus
string ← ∾´ FoldCell˘ matplusplus

•Show string

# 3 GetLastData string
GetLastData ← ⌽-⊸↑⟜('.'⊸≠⊸/)

part1 ← {
    numfree ← +´ string = '.'
    numblock ← +´ string ≠ '.'
    compressed ← numblock ↑ (numfree GetLastData string)⌾((string='.')⊸/) string
    # compute checksum
    #compressed ≍ compressed
    [a,b] ← (⊣≍(↕≠)) compressed
    +´ a×b
}

•Show part1