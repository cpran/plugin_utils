include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@plan(12)

@rndstr(0, "")
@ok( rndstr.return$ = "", "string of length 0")

@rndstr(5, "")
@ok( rndstr.charset$ = "a1", "default character set is lowercase alphanumeric")

@rndstr(10, "c")
@ok( !index_regex(rndstr.return$, "[^bcdfghjklmnpqrstvwxyz]"),
  ... "lowercase consonant character set well defined")

@rndstr(10, "v")
@ok( !index_regex(rndstr.return$, "[^aeiou]"),
  ... "lowercase vowel character set well defined")

@rndstr(10, "a")
@ok( !index_regex(rndstr.return$, "[^a-z]"),
  ... "lowercase alphabetic character set well defined")

@rndstr(10, "C")
@ok( !index_regex(rndstr.return$, "[^BCDFGHJKLMNPQRSTVWXYZ]"),
  ... "uppercase consonant character set well defined")

@rndstr(10, "V")
@ok( !index_regex(rndstr.return$, "[^AEIOU]"),
  ... "uppercase vowel character set well defined")

@rndstr(10, "A")
@ok( !index_regex(rndstr.return$, "[^A-Z]"),
  ... "uppercase alphabetic character set well defined")

@rndstr(10, "1")
@ok( !index_regex(rndstr.return$, "[^0-9]"),
  ... "numeric character set well defined")

@rndstr(10, "%")
@ok( !index_regex(rndstr.return$, "[^!?@#$%&+_]"),
  ... "symbol character set well defined")

@rndstr(5, ":#")
@ok( rndstr.return$ == "#####",
  ... "single character custom set")

@rndstr(5, "::")
@ok( rndstr.return$ == ":::::",
  ... "colons allowed in custom character set")

@done_testing()
