include ../../plugin_tap/procedures/simple.proc
include ../procedures/utils.proc

@plan(4)

@toUpper("Abraham Lincoln")
@ok( !index_regex(toUpper.return$, "[a-z]"), "works on mixed case" )

@toUpper("abraham lincoln")
@ok( !index_regex(toUpper.return$, "[a-z]"), "works on all lowercase" )

@toUpper("ABRAHAM LINCOLN")
@ok( !index_regex(toUpper.return$, "[a-z]"), "works on all uppercase" )

@toUpper("")
@ok( !index_regex(toUpper.return$, "[a-z]"), "works on empty strings" )

@done_testing()
