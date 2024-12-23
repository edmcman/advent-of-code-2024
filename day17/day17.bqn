NN ← (>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢
ToNats ← { NN 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

in ← (ToNats•file.Bytes) "input.txt"
⟨a,b,c⟩‿prog ← ((3⊸↑)⋈((∘‿2⊸⥊)∘(3⊸↓))) in

ToBin ← 2{𝕩=0?↕0;(𝕊⌊𝕩÷𝕗)∾𝕗|𝕩}
FromBin ← 2⊸×⊸+˜´⌽

MkState ← {𝕊⟨a,b,c⟩‿prog:
    a‿b‿c‿prog ⇐ #a‿b‿c‿prog
    pc ⇐ 0
    output ⇐ ⟨⟩
    4
    IncPC ← {𝕊: pc ↩ pc+1 }
    GetCombo ← {
        ⊑𝕩∊[0,1,2,3] ? 𝕩 ;
        𝕩≡4 ? a ;
        𝕩≡5 ? b ;
        𝕩≡6 ? c ;
        !0
    }
    Step ⇐ {𝕊:
        ! ¬ Done@
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
                b ↩ ⊑ [b] 8•bit._xor op
                #FromBin (ToBin b)≠(ToBin op)
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
                b ↩ ⊑ [b] 32•bit._xor c
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