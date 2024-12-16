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
    HasObstacleHuh ⇐ {𝕤⋄'#'=⊑⟜grid}
    HasObstacle ⇐ {𝕤
        '#'=𝕩⊑grid
    }
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
    SetGrid ⇐ {𝕤⋄grid ↩ 𝕩}
}

While ← {𝕩•_while_𝕨@}´

Part1 ← {𝕤
    state ← MkState 𝕩

    While {𝕤⋄state.OnGrid state.coord}‿{𝕤
        state.Step @
        #•Show state.coord
    }

    count ← +´⥊'X'=state.grid
}

IsCycle ← {𝕊:
    state ← 𝕩
    seen ← ⟨⟩
    GetSt ← {𝕊: ⋈ (state.dir⋈state.coord)}
    While {𝕤⋄(state.OnGrid state.coord) ∧ ⊑¬(<GetSt@)∊seen}‿{𝕤
        #•Show state.coord
        ! ⊑¬(<GetSt@)∊seen
        seen ↩ seen∾<GetSt@
        ! (≠seen) < 100000
        ! ⊑(<GetSt@)∊seen
        state.Step @
        #•Show state.grid
        #•Show ≠seen

    }
    ⊑(<GetSt@)∊seen
}

Indices ← /○⥊⟜(↕≢)

Part2 ← {𝕊:
    in ← 𝕩
    state ← MkState 𝕩
    possibles ← Indices ('#'⊸≠∧ '^'⊸≠) state.grid

    # only test the states in the original path!

    TestCoord ← {𝕤
        state ← MkState in
        state.SetGrid '#'⌾(𝕩⊸ ⊑) state.grid
        #•Show state.grid
        #•Show 𝕩
        IsCycle state
    }

    #TestCoord 6‿3
    +´ TestCoord¨ possibles
    #42
    #IsCycle MkState 𝕩
}

#•Show Part1 in
•Show Part2 in

