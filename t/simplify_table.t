include ../../plugin_tap/procedures/more.proc

utils$ = preferencesDirectory$ + "/plugin_utils/scripts/"

@no_plan()

numeric_table = Create Table with column names: "nums", 0, "numa numb numc"
for r to 10
  Append row
  for c to Object_'numeric_table'.ncol
    Set numeric value: r, do$("Get column label...", c), randomUniform(0 ,1)
  endfor
endfor

name$ = "numcopy"
suffix$ = "_suffix"

numeric_copy = Copy: name$

runScript: utils$ + "simplify_table.praat", 3, suffix$, ""

@isnt: numberOfSelected("Table"), 0,
  ... "table selected after running with suffix"

@is$: selected$("Table"), name$ + suffix$,
  ... "appended suffix to table name"

@is: objectsAreIdentical(numeric_table, selected()), 0,
  ... "changes not inline with suffix"

Remove

selectObject: numeric_copy

runScript: utils$ + "simplify_table.praat", 3, "", ""

@isnt: numberOfSelected("Table"), 0,
  ... "table selected after running without suffix"

@is: numeric_copy, selected(),
  ... "no change in selection without suffix"

@is: objectsAreIdentical(numeric_table, selected()), 0,
  ... "changes inline without suffix"

removeObject: numeric_copy, numeric_table

@ok_selection()

@done_testing()
