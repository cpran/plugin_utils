include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@plan(15)

@strcount_regex: "Hello world", "l"
@ok: strcount_regex.return == 3,
  ... "Count extant single ASCII characters"

@strcount_regex: "Hello world", "x"
@ok: strcount_regex.return == 0,
  ... "Count absent single ASCII characters"

@strcount_regex: "", "x"
@ok: strcount_regex.return == 0,
  ... "strount takes empty strings"

@strcount_regex: "Nenúfar", ""
@ok: strcount_regex.return == 1,
  ... "Empty string is found once"

@strcount_regex: "", ""
@ok: strcount_regex.return == 1,
  ... "Empty string is found once"

@strcount_regex: "Pingüino Rodríguez", "l"
@ok: strcount_regex.return == 0,
  ... "strcount_regex takes strings with diacritics"

@strcount_regex: "Pingüino Rodríguez", "ü"
@ok: strcount_regex.return == 1,
  ... "Count absent single unicode characters"

@strcount_regex: "Hello world", "á"
@ok: strcount_regex.return == 0,
  ... "Count absent single unicode characters"

@strcount_regex: "Squeeze the breeze", "eeze"
@ok: strcount_regex.return == 2,
  ... "Count extant multiple ASCII characters"

@strcount_regex: "lingüística", "üí"
@ok: strcount_regex.return == 1,
  ... "Count extant multiple unicode characters"

@strcount_regex: "あいうえおえういあ", "あ"
@ok: strcount_regex.return == 2,
  ... "Count extant single unicode characters (hiragana)"

@strcount_regex: "わがはいは猫である", "猫"
@ok: strcount_regex.return == 1,
  ... "Count extant single unicode characters (kanji)"

@ok: 1, "Regular strcount calls work with strcount_regex"

@strcount_regex: "Hello world", "[rl]"
@ok: strcount_regex.return == 4,
  ... "Count extant character classes"

@strcount_regex: "Hello world", "l{2}"
@ok: strcount_regex.return == 1,
  ... "Count extant quantifier"

@done_testing()
