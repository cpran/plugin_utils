include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 5

@toLower: "Abraham Lincoln"
@like: toLower.return$, "[A-Z]", "works on mixed case"

@toLower: "abraham lincoln"
@like: toLower.return$, "[A-Z]", "works on all lowercase"

@toLower: "ABRAHAM LINCOLN"
@like: toLower.return$, "[A-Z]", "works on all uppercase"

@toLower: ""
@like: toLower.return$, "[A-Z]", "works on empty strings"

@ok_selection()

@done_testing()
