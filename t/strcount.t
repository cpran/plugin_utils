include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@no_plan(12)

@strcount: "Hello world", "l"
@ok: strcount.return == 3,
  ... "Count extant single ASCII characters"

@strcount: "Hello world", "x"
@ok: strcount.return == 0,
  ... "Count absent single ASCII characters"

@strcount: "", "x"
@ok: strcount.return == 0,
  ... "strount takes empty strings"

@strcount: "Nenúfar", ""
@ok: strcount.return == 1,
  ... "Empty string is found once"

@strcount: "", ""
@ok: strcount.return == 1,
  ... "Empty string is found once"

@strcount: "Pingüino Rodríguez", "l"
@ok: strcount.return == 0,
  ... "strcount takes strings with diacritics"

@strcount: "Pingüino Rodríguez", "ü"
@ok: strcount.return == 1,
  ... "Count absent single unicode characters"

@strcount: "Hello world", "á"
@ok: strcount.return == 0,
  ... "Count absent single unicode characters"

@strcount: "Squeeze the breeze", "eeze"
@ok: strcount.return == 2,
  ... "Count extant multiple ASCII characters"

@strcount: "lingüística", "üí"
@ok: strcount.return == 1,
  ... "Count extant multiple unicode characters"

@strcount: "あいうえおえういあ", "あ"
@ok: strcount.return == 2,
  ... "Count extant single unicode characters (hiragana)"

@strcount: "わがはいは猫である", "猫"
@ok: strcount.return == 1,
  ... "Count extant single unicode characters (kanji)"

@done_testing()
