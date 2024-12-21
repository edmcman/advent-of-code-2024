in ← '0'-˜>•file.Lines "input.txt"
OnGrid ← ∧´(≥⟜0)∾<⟜(≢in)
GetIndices ← /○⥊⟜(↕≢)

dirs ← ⟨
    0‿1
    1‿0
    0‿¯1
    ¯1‿0
⟩
 
Succ ← {grid Succ coord:
    {(𝕩⊑grid) = 1+coord⊑grid}⊸/ OnGrid¨⊸/ (<coord) + dirs
}
Goal ← 9⊸=⊑

S ← {grid‿visited S coord:
    #•Show "coord" ⋈ coord
    {⊑(<coord) ∊ visited ?
     visited ;
     visited ↩ (⍷visited∾(⋈coord))
     ⍷ visited ∾´ grid‿visited⊸S¨ (grid Succ coord)
    }
}

# Need to find trailheads
trailheads ← GetIndices in=0
part1 ← +´ {{+´ 9=𝕩 ⊑ in} in‿⟨⟩⊸S 𝕩}¨ trailheads

SP2 ← {grid‿visited‿path S coord:
    //•Show "coord" ⋈ coord
    path ↩ path∾(⋈coord)
    goals ← ⟨coord Goal grid⟩ / ⟨⋈path⟩
    //•Show "goals" ⋈ goals
    {⊑(<coord) ∊ visited ?
     goals;
     visited ↩ (⍷visited∾(⋈coord))

     goals ∾´ grid‿visited‿path⊸S¨ (grid Succ coord)
    }
}

part2 ← +´ {≠ in‿⟨⟩‿⟨⟩⊸SP2 𝕩}¨ trailheads
