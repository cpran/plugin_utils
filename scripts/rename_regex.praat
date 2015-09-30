form Rename (regex)...
  sentence Pattern
  sentence Replacement
endform

total = numberOfSelected()
for i to total
  myobject[i] = selected(i)
endfor

for i to total
  selectObject: myobject[i]
  Rename: replace_regex$(extractWord$(selected$(), " "), pattern$, replacement$, 0)
endfor

nocheck selectObject: undefined
for i to total
  plusObject: myobject[i]
endfor
