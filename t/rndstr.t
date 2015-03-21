include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/time.proc

@plan(6)

@rndstr(0, "")
@ok( rndstr.return$ = "", "rndstr: string of length 0")

@rndstr(5, "")
@ok( rndstr.charset$ = "a1", "rndstr: default character set is lowercase alphanumeric")

@rndstr(10, "a")
@ok( !index_regex(rndstr.return$, "[^a-z]"), "rndstr: lowercase alphabetic character set well defined")

@rndstr(10, "A")
@ok( !index_regex(rndstr.return$, "[^A-Z]"), "rndstr: uppercase alphabetic character set well defined")

@rndstr(10, "1")
@ok( !index_regex(rndstr.return$, "[^0-9]"), "rndstr: numeric character set well defined")

@rndstr(10, "%")
@ok( !index_regex(rndstr.return$, "[^!?@#$%&+_]"), "rndstr: symbol character set well defined")

@done_testing()
