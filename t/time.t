include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/time.proc

date$ = date$()
@time()

filler$ = if windows then "0" else " " fi
test$ = time.dw$         + " " +
    ... time.mo$         + " " +
    ... if length(string$(time.dm)) = 1 then filler$ else "" fi +
    ... string$(time.dm) + " " +
    ... time.tm$         + " " +
    ... string$(time.yr)

@plan(1)

@ok( if date$ = test$ then 1 else 0 fi , "time: can reproduce native format" )
appendInfoLine: "# ", date$, " = ", test$

@done_testing()


