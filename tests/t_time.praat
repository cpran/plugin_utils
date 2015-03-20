include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/time.proc

date$ = date$()
@time()

test$ = time.dw$         + " " +
    ... time.mo$         + " " +
    ... string$(time.dm) + " " +
    ... time.tm$         + " " +
    ... string$(time.yr)

@plan(1)
@ok( date$ = test$ , "time: can reproduce native format" )

@done_testing()
