include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/utils.proc

@plan(11)

@rndstr(0, "")
@ok( rndstr.return$ = "", "rndstr: string of length 0")

@rndstr(5, "")
@ok( rndstr.charset$ = "a1", "rndstr: default character set is lowercase alphanumeric")

@rndstr(10, "c")
@ok( !index_regex(rndstr.return$, "[^bcdfghjklmnpqrstvwxyz]"),
  ... "rndstr: lowercase consonant character set well defined")

@rndstr(10, "v")
@ok( !index_regex(rndstr.return$, "[^aeiou]"),
  ... "rndstr: lowercase vowel character set well defined")

@rndstr(10, "a")
@ok( !index_regex(rndstr.return$, "[^a-z]"),
  ... "rndstr: lowercase alphabetic character set well defined")

@rndstr(10, "C")
@ok( !index_regex(rndstr.return$, "[^BCDFGHJKLMNPQRSTVWXYZ]"),
  ... "rndstr: uppercase consonant character set well defined")

@rndstr(10, "V")
@ok( !index_regex(rndstr.return$, "[^AEIOU]"),
  ... "rndstr: uppercase vowel character set well defined")

@rndstr(10, "A")
@ok( !index_regex(rndstr.return$, "[^A-Z]"),
  ... "rndstr: uppercase alphabetic character set well defined")

@rndstr(10, "1")
@ok( !index_regex(rndstr.return$, "[^0-9]"),
  ... "rndstr: numeric character set well defined")

@rndstr(10, "%")
@ok( !index_regex(rndstr.return$, "[^!?@#$%&+_]"),
  ... "rndstr: symbol character set well defined")

@rndstr(5, ":#")
@ok( rndstr.return$ == "#####",
  ... "rndstr: single character custom set")

@done_testing()
