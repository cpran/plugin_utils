include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/time.proc

date$ = date$()
@time()

test$ = time.dw$         + " " +
    ... time.mo$         + " " +
    ... if length(string$(time.dm)) = 1 then " " else "" fi +
    ... string$(time.dm) + " " +
    ... time.tm$         + " " +
    ... string$(time.yr)

@plan(1)

@ok( if date$ = test$ then 1 else 0 fi , "time: can reproduce native format" )
appendInfoLine: "# ", date$, " = ", test$

@done_testing()


