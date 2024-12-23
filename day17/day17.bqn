NN ← (>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢
ToNats ← { NN 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

in ← (ToNats•file.Bytes) "input.txt"
⟨a,b,c⟩‿prog ← ((3⊸↑)⋈((∘‿2⊸⥊)∘(3⊸↓))) in

ToBin ← 2{𝕩=0?↕0;(𝕊⌊𝕩÷𝕗)∾𝕗|𝕩}
FromBin ← 2⊸×⊸+˜´⌽

MkState ← {𝕊⟨a,b,c⟩‿prog:
    a‿b‿c‿prog ⇐
    pc ⇐ 0
    output ⇐ ⟨⟩
    IncPC ← {𝕊: pc ↩ pc+1 }
    GetCombo ← {
        ⊑𝕩∊[0,1,2,3] ? 𝕩 ;
        𝕩≡4 ? a ;
        𝕩≡5 ? b ;
        𝕩≡6 ? c ;
        !0
    }
    Print ← {𝕊:
        •Show "a" ⋈ a
        •Show "b" ⋈ b
        •Show "c" ⋈ c
    }
    Step ⇐ {𝕊:
        opcode‿op ← pc ⊏ prog
        {
            # adv
            opcode≡0 ? {
                num ← a
                div ← 2⋆GetCombo op
                a ↩ ⌊num ÷ div
            } ;
            # bxl
            opcode=1 ? {
                b ↩ ⊑ [8 | b] 8•bit._xor (8 | op)
            } ;
            # bst
            opcode=2 ? {
                b ↩ 8 | GetCombo op
            } ;
            # jnz
            opcode=3 ? {
                {a≢0 ? pc ↩ op ÷ 2; IncPC @}
            } ;
            # bxc
            opcode=4 ? {
                b ↩ ⊑ [8 | b] 8•bit._xor (8 | c)
            } ;
            # out
            opcode=5 ? {
                output ↩ output ∾ 8 | GetCombo op
            } ;
            # bdv
            opcode=6 ? {
                num ← a
                div ← 2⋆GetCombo op
                b ↩ ⌊num ÷ div
            } ;
            # cdv
            opcode=7 ? {
                num ← a
                div ← 2⋆GetCombo op
                c ↩ ⌊num ÷ div
            } ; !
        }
        # for all but opcode 3, advance pc
        {opcode≠3 ? IncPC @ ; @}
    }
    Done ⇐ {𝕊: pc ≥ ≠prog}
    Run ⇐ {𝕊: Step •_while_ (¬∘Done) @
        output
    }
}

Join ← {1↓⥊𝕨≍˘𝕩}

part1 ←  ',' Join '0' + (MkState ⟨a,b,c⟩‿prog).Run @

# Start with last byte and work forward

Part2 ← {prog 𝕊 in‿n:

    goal ← ⌽ (n+1)↑ ⌽⥊prog
    solns ← / (<goal) ≡¨ {𝕊: (MkState ⟨in+𝕩,0,0⟩‿prog).Run @}¨ (↕8)

    {goal≡⥊prog ? •Show "GOAL!" ⋄ in + solns ;

    # shift left by 3 bits
    ⟨⟩ ∾´ {prog Part2 𝕩‿(n+1)}¨ (8 × (in + solns))
}}

p2s ← prog Part2 0‿0
p2 ← ⌊´ p2s

st ← MkState ⟨p2,0,0⟩‿prog
st.Run @
#•Show st.output
#•Show prog
!st.output ≡ ⥊prog

