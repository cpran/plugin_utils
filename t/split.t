include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 3

string$ = "apple"
random$ = string$
string$ = "a," + random$ + ",a"
@split: ",", string$

@is:  split.length,     3,                "right number of chunks"
@is$: split.return$[2], random$,          "indexing works"
@is$: split.return$[1], split.return$[3], "string properly split"

@done_testing()
