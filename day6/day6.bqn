in ← >•file.Lines "input.txt"

FindStartIndex ← ⊑∘/○⥊⟜(↕≢)≡¨⟜'^'

dirs ← 'U'‿'R'‿'D'‿'L'
deltas ← (¯1‿0)‿(0‿1)‿(1‿0)‿(0‿¯1)
MkState ← {
    dir⇐0
    
    grid⇐𝕩
    coord⇐FindStartIndex 𝕩
    GetDirDelta ⇐ {𝕤
        dir ⊑ deltas
    }
    #HasObstacle ⇐ { '#'=𝕩⊑grid }
    OnGrid ⇐ ∧´(≥⟜0)∾<⟜(≢grid)
    HasObstacle ⇐ '#'=⊑⟜grid
    Turn ⇐ {𝕤
        dir ↩ 4|dir+1
    }

    Step ⇐ {𝕤
        grid ↩ 'X'⌾(coord⊸ ⊑) grid
        newcoord ← coord + GetDirDelta dir
        {OnGrid newcoord ?
        {
            HasObstacle newcoord ?
            # Can't move in current direction, try turning.
            Turn @;
            # Otherwise move
            coord ↩ newcoord
        };
        # Move off the grid.
        coord ↩ newcoord}
    }
}

While ← {𝕩•_while_𝕨@}´

Part1 ← {𝕤
    state ← MkState 𝕩

    While {𝕤⋄state.OnGrid state.coord}‿{𝕤
        state.Step @
        #•Show state.coord
    }

    •Show count ← +´⥊'X'=state.grid
}

Part1 in