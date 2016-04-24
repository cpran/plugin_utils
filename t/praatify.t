include ../../plugin_tap/procedures/simple.proc
include ../procedures/utils.proc

@no_plan()

@praatifyString: "string with spaces"
@ok: praatifyString.return$ == "string_with_spaces",
  ... "string with spaces"

@praatifyString: ""
@ok: praatifyString.return$ == "",
  ... "empty string"

@praatifyString: "Hello, World!"
@ok: praatifyString.return$ == "Hello__World_",
  ... "string with punctuation"

@done_testing()
