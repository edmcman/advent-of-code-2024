in ← •file.Lines "sample.txt"

emptylines ← in ≡¨ <""
groupindices ← (2×emptylines) -˜ +` emptylines
groups ← groupindices⊔in

•Show groups

#•Show GroupIndices

#in = >"hi"
#in = <""