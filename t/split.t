include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@plan(3)

string$ = "apple"
random$ = string$
string$ = "a," + random$ + ",a"
@split(",", string$)

@ok( split.length = 3, "split: right number of chunks" )
@ok( split.return$[2] = random$, "split: indexing works" )
@ok( split.return$[1] = split.return$[3], "split: string properly split" )

@done_testing()
