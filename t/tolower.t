include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 5

@toLower: "Abraham Lincoln"
@unlike: toLower.return$, "[A-Z]", "works on mixed case"

@toLower: "abraham lincoln"
@unlike: toLower.return$, "[A-Z]", "works on all lowercase"

@toLower: "ABRAHAM LINCOLN"
@unlike: toLower.return$, "[A-Z]", "works on all uppercase"

@toLower: ""
@unlike: toLower.return$, "[A-Z]", "works on empty strings"

@ok_selection()

@done_testing()
