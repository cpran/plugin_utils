include ../../plugin_testsimple/procedures/test_simple.proc

@plan(5)

include ../procedures/utils.proc
@ok(1, "can include utils")

include ../procedures/time.proc
@ok(1, "can include time")

include ../procedures/require.proc
@ok(1, "can include require")

include ../procedures/check_directory.proc
@ok(1, "can include check_directory")

include ../procedures/check_filename.proc
@ok(1, "can include check_filename")

@done_testing()
