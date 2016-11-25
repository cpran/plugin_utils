include ../../plugin_tap/procedures/more.proc
include ../procedures/time.proc

date$ = date$()
@time()

@plan: 3

filler$ = if windows then "0" else " " fi
test$ = left$(time.dw$, 3) + " " +
    ... left$(time.mo$, 3) + " " +
    ... if length(string$(time.dm)) = 1 then filler$ else "" fi +
    ... string$(time.dm)   + " " +
    ... time.tm$           + " " +
    ... string$(time.yr)

@todo: 1, "Is this test locale dependent?"
@is$: date$, test$, "can reproduce native format"
@diag: date$ + " = " + test$

date$ = "Tue Apr 19 21:57:02 2016"
@parseTime: date$

@is$: parseTime.dw$, "Tuesday",
  ... "can find full name of day"

@is$: parseTime.mo$, "April",
  ... "can find full name of month"

@done_testing()
