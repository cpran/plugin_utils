include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 13

@rndstr: 0, ""
@is$: rndstr.return$, "", "string of length 0"

@rndstr: 5, ""
@is$: rndstr.charset$, "a1", "default character set is lowercase alphanumeric"

@rndstr: 10, "c"
@unlike: rndstr.return$, "[^bcdfghjklmnpqrstvwxyz]",
  ... "lowercase consonant character set well defined"

@rndstr: 10, "v"
@unlike: rndstr.return$, "[^aeiou]",
  ... "lowercase vowel character set well defined"

@rndstr: 10, "a"
@unlike: rndstr.return$, "[^a-z]",
  ... "lowercase alphabetic character set well defined"

@rndstr: 10, "C"
@unlike: rndstr.return$, "[^BCDFGHJKLMNPQRSTVWXYZ]",
  ... "uppercase consonant character set well defined"

@rndstr: 10, "V"
@unlike: rndstr.return$, "[^AEIOU]",
  ... "uppercase vowel character set well defined"

@rndstr: 10, "A"
@unlike: rndstr.return$, "[^A-Z]",
  ... "uppercase alphabetic character set well defined"

@rndstr: 10, "1"
@unlike: rndstr.return$, "[^0-9]",
  ... "numeric character set well defined"

@rndstr: 10, "%"
@unlike: rndstr.return$, "[^!?@#$%&+_]",
  ... "symbol character set well defined"

@rndstr: 5, ":#"
@is$: rndstr.return$, "#####",
  ... "single character custom set"

@rndstr: 5, "::"
@is$: rndstr.return$, ":::::",
  ... "colons allowed in custom character set"

@ok_selection()

@done_testing()
