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

#•Show > ListThing 53‿13

#•Show IsUpdateOK 75‿47‿61‿53‿29
#•Show IsUpdateOK 61‿13‿29
#•Show >IsPairOK⌜˜ 61‿13‿29
#•Show ListThing 61‿13‿29

Middle ← {(⌊2 ÷˜ ≠𝕩) ⊑ 𝕩}
#Middle ← (+1)∘(÷2)≠

part1 ← +´ Middle¨ (IsUpdateOK¨ parsed.updates) / parsed.updates
•Show part1