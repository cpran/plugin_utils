include ../../plugin_tap/procedures/simple.proc
include ../procedures/utils.proc

@plan(3)

string$ = "apple"
random$ = string$
string$ = "a," + random$ + ",a"
@split(",", string$)

@ok( split.length = 3, "right number of chunks" )
@ok( split.return$[2] = random$, "indexing works" )
@ok( split.return$[1] = split.return$[3], "string properly split" )

@done_testing()
