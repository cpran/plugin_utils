include ../../plugin_testsimple/procedures/test_simple.proc

@plan(3)

include ../procedures/utils.proc
@ok( 1, "can include")

@numchar("apples, oranges, bananas", ",")
@ok( numchar.return = 2, "numchar: can count characters" )

@numchar("", ",")
@ok( numchar.return = 0, "numchar: can count empty strings" )

@done_testing()
