in ← >•file.Lines "input.txt"
#•Show in

OnGrid ← ∧´(≥⟜0)∾<⟜(≢in)
GetIndices ← /○⥊⟜(↕≢)

dirs ← ⟨
    0‿1
    1‿0
    0‿¯1
    ¯1‿0
⟩

Search ← {grid‿type 𝕊 coord‿visited:
    visited ↩ (⍷visited∾(⋈coord))
    # wow so tacit!
    neighbors ← (¬∘∊⟜visited⊸/) ((type=⊑⟜grid)⊸/) (OnGrid¨⊸/) dirs + <coord
    visited {grid‿type Search 𝕩‿𝕨}˜´ neighbors
}
Search_helper ← {grid𝕊coord: grid‿(coord⊑grid) Search coord‿⟨⟩}

#•Show ≠ (in)‿'R' Search (0‿0)‿⟨⟩

Perimiter ← {grid‿type 𝕊 coords:
    all ← ⥊>{dirs + <𝕩}¨ coords
    #•Show all
    us ← ((type=⊑⟜grid)⊸/) (OnGrid¨⊸/) all
    (≠all) - ≠us
}

Price ← {grid 𝕊 coord:
    type ← coord⊑grid
    coords ← grid‿type Search coord‿⟨⟩
    perim ← grid‿type Perimiter coords
    (≠coords)×perim
}

Part1 ← {𝕊 grid:
    regions ← ⍷>{⊏ ∧grid Search_helper 𝕩}¨ GetIndices grid=grid
    +´ (<grid) Price¨ regions
}