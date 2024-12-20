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

#•Show matplusplus
string ← ∾´ {<((1⊑𝕩) Repeat ⊑𝕩) ∾ ((2⊑𝕩) Repeat '.')}˘ matplusplus

#•Show string

# 3 GetLastData string
GetLastData ← ⌽-⊸↑⟜('.'⊸≠⊸/)

part1 ← {
    numfree ← +´ string = '.'
    compressed ← (-numfree) ↓ (numfree GetLastData string)⌾((string='.')⊸/) string
    +´ (⊣×(↕≠)) compressed
}

•Show part1

stringp2 ← ∾´ {<((1⊑𝕩) Repeat ⊑𝕩) ∾ ((2⊑𝕩) Repeat -(1+⊑𝕩))}˘ matplusplus

ReplaceNegWithNegOne ← {¯1¨⌾((𝕩<0)⊸/) 𝕩}

# 𝕨: the string
# 𝕩: number to attempt to move
MoveItP2 ← {𝕊:
    thingtomove ← 𝕩⊑⊔˜ReplaceNegWithNegOne 𝕨
    #•Show "thingtomove" ⋈ thingtomove
    size ← ≠thingtomove

    #test ←  ReplaceNegWithNegOne (-stringp2 + 1)
    #•Show "test" ⋈ test

    oldindex ← ⊑/(𝕨=𝕩)
    #•Show "oldindex" ⋈ oldindex
    leftstring ← oldindex↑𝕨
    #•Show "leftstring" ⋈ leftstring

    freegroups ← ⊔˜ ReplaceNegWithNegOne (-leftstring + 1)
    freegroupsizes ← ≠¨ freegroups
    #•Show "freegroups" ⋈ freegroups

    # big enough groups
    #•Show (<size)≤freegroupsizes
    bigenough ← / (<size)≤freegroupsizes

    #•Show bigenough

    𝕨 {
        (≠bigenough) > 0 ?
        destgroupnum ← -1+⊑bigenough
    
        #•Show "move to free group" ⋈ destgroupnum

        # move
        moved ← {thingtomove⌾(size↑((𝕩=destgroupnum)⊸/)) 𝕩} 𝕨

        # free the old location
        # XXX change me
        newfreegrp ← -1+≠freegroupsizes
        newfreegrp¨⌾((𝕨=𝕩)⊸/) moved
        
        ;
        #•Show "no move"
        𝕨
    } 𝕩
}

#•Show stringp2 MoveItP2 1

part2 ← {
    compressed ← stringp2 MoveItP2˜´ (⍷ {𝕩≥0}⊸/ stringp2)
    +´ (⊣×(↕≠)) {0¨⌾((𝕩<0)⊸/) 𝕩} compressed
}

•Show part2