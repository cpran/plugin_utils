include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 5

@toUpper: "Abraham Lincoln"
@like: toUpper.return$, "[a-z]", "works on mixed case"

@toUpper: "abraham lincoln"
@like: toUpper.return$, "[a-z]", "works on all lowercase"

@toUpper: "ABRAHAM LINCOLN"
@like: toUpper.return$, "[a-z]", "works on all uppercase"

@toUpper: ""
@like: toUpper.return$, "[a-z]", "works on empty strings"

@ok_selection()

@done_testing()
