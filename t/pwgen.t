include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/utils.proc

@plan(2)

@pwgen(10)
string$ = pwgen.return$

@ok( string$ != "",        "pwgen: string not empty" )
@ok( length(string$) = 10, "pwgen: string has right length" )

@done_testing()
