include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@plan(4)

@toLower("Abraham Lincoln")
@ok( !index_regex(toLower.return$, "[A-Z]"), "toLower: works on mixed case" )

@toLower("abraham lincoln")
@ok( !index_regex(toLower.return$, "[A-Z]"), "toLower: works on all lowercase" )

@toLower("ABRAHAM LINCOLN")
@ok( !index_regex(toLower.return$, "[A-Z]"), "toLower: works on all uppercase" )

@toLower("")
@ok( !index_regex(toLower.return$, "[A-Z]"), "toLower: works on empty strings" )

@done_testing()
