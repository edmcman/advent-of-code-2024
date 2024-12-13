in ← •file.Lines "input.txt"

Split ← {(<𝕨) ((⊢-˜+`×¬)∘=⊔⊢)¨ 𝕩}
ParseInt ← (10⊸×⊸+˜´∘⌽-⟜'0')



emptylines ← in ≡¨ <""
groupindices ← (2×emptylines) -˜ +` emptylines
parsed ← {
    groups ← groupindices⊔in
    orderings ⇐ ParseInt¨ > ('|' Split ⊑groups)
    updates ⇐ ParseInt¨¨ ',' Split 1⊑groups
}


# x_w means X must come before W
IsPairOK ← {¬ 𝕩‿𝕨 ∊ parsed.orderings}
CanComeBefore ← IsPairOK

ListThing ← >⌜˜ ∘ ↕≠
IsUpdateOK ← {∧´⥊(ListThing 𝕩) ∨ (>IsPairOK⌜˜ 𝕩)}

Middle ← {(⌊2 ÷˜ ≠𝕩) ⊑ 𝕩}

part1 ← +´ Middle¨ (IsUpdateOK¨ parsed.updates) / parsed.updates
•Show part1

SortOneUpdate ← { (⍒ >(∾⌜˜ 𝕩) ∊¨ <parsed.orderings) ⊏ 𝕩}

#•Show 53‿13 ∊ parsed.orderings

#part2 ← SortOneUpdate¨ parsed.updates
part2 ← +´ Middle¨ SortOneUpdate¨ (¬ IsUpdateOK¨ parsed.updates) / parsed.updates
•Show part2
#•Show SortOneUpdate ↑ parsed.updates