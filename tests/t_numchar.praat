include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/utils.proc

@plan(2)

@numchar("apples, oranges, bananas", ",")
@ok( numchar.return = 2, "numchar: can count characters" )
@numchar("", ",")
@ok( numchar.return = 0, "numchar: can count empty strings" )

@done_testing()
