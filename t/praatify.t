include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 4

@praatifyString: "string with spaces"
@is$: praatifyString.return$, "string_with_spaces",
  ... "string with spaces"

@praatifyString: ""
@is$: praatifyString.return$, "",
  ... "empty string"

@praatifyString: "Hello, World!"
@is$: praatifyString.return$, "Hello__World_",
  ... "string with punctuation"

@ok_selection()

@done_testing()
