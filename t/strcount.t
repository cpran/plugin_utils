include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 13

@strcount: "Hello world", "l"
@is: strcount.return, 3,
  ... "Count extant single ASCII characters"

@strcount: "Hello world", "x"
@is: strcount.return, 0,
  ... "Count absent single ASCII characters"

@strcount: "", "x"
@is: strcount.return, 0,
  ... "strount takes empty strings"

@strcount: "Nenúfar", ""
@is: strcount.return, 1,
  ... "Empty string is found once"

@strcount: "", ""
@is: strcount.return, 1,
  ... "Empty string is found once"

@strcount: "Pingüino Rodríguez", "l"
@is: strcount.return, 0,
  ... "strcount takes strings with diacritics"

@strcount: "Pingüino Rodríguez", "ü"
@is: strcount.return, 1,
  ... "Count absent single unicode characters"

@strcount: "Hello world", "á"
@is: strcount.return, 0,
  ... "Count absent single unicode characters"

@strcount: "Squeeze the breeze", "eeze"
@is: strcount.return, 2,
  ... "Count extant multiple ASCII characters"

@strcount: "lingüística", "üí"
@is: strcount.return, 1,
  ... "Count extant multiple unicode characters"

@strcount: "あいうえおえういあ", "あ"
@is: strcount.return, 2,
  ... "Count extant single unicode characters (hiragana)"

@strcount: "わがはいは猫である", "猫"
@is: strcount.return, 1,
  ... "Count extant single unicode characters (kanji)"

@ok_selection()

@done_testing()
