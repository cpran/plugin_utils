include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 15

@strcount_regex: "Hello world", "l"
@is: strcount_regex.return, 3,
  ... "Count extant single ASCII characters"

@strcount_regex: "Hello world", "x"
@is: strcount_regex.return, 0,
  ... "Count absent single ASCII characters"

@strcount_regex: "", "x"
@is: strcount_regex.return, 0,
  ... "strount takes empty strings"

@strcount_regex: "Nenúfar", ""
@is: strcount_regex.return, 1,
  ... "Empty string is found once"

@strcount_regex: "", ""
@is: strcount_regex.return, 1,
  ... "Empty string is found once"

@strcount_regex: "Pingüino Rodríguez", "l"
@is: strcount_regex.return, 0,
  ... "strcount_regex takes strings with diacritics"

@strcount_regex: "Pingüino Rodríguez", "ü"
@is: strcount_regex.return, 1,
  ... "Count absent single unicode characters"

@strcount_regex: "Hello world", "á"
@is: strcount_regex.return, 0,
  ... "Count absent single unicode characters"

@strcount_regex: "Squeeze the breeze", "eeze"
@is: strcount_regex.return, 2,
  ... "Count extant multiple ASCII characters"

@strcount_regex: "lingüística", "üí"
@is: strcount_regex.return, 1,
  ... "Count extant multiple unicode characters"

@strcount_regex: "あいうえおえういあ", "あ"
@is: strcount_regex.return, 2,
  ... "Count extant single unicode characters (hiragana)"

@strcount_regex: "わがはいは猫である", "猫"
@is: strcount_regex.return, 1,
  ... "Count extant single unicode characters (kanji)"

@strcount_regex: "Hello world", "[rl]"
@is: strcount_regex.return, 4,
  ... "Count extant character classes"

@strcount_regex: "Hello world", "l{2}"
@is: strcount_regex.return, 1,
  ... "Count extant quantifier"

@ok_selection()

@done_testing()
