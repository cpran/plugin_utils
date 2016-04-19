include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/require.proc
include ../procedures/try.proc

@plan(5)

@compareSemVer: praatVersion$, praatVersion$
@ok: !compareSemVer.newer, "check same version"

@compareSemVer: "6.0", praatVersion$
@ok: compareSemVer.newer > 0, "first term is older"

@compareSemVer: praatVersion$, "6.0"
@ok: compareSemVer.newer < 0, "second term is older"

call try
  ... include ../procedures/require.proc \n
  ... @require: praatVersion$            \n
@ok: !try.catch, "no errors when requiring current version"

call try
  ... include ../procedures/require.proc \n
  ... @require: "1" + praatVersion$      \n
@ok: try.catch, "requiring higher version exits"

@done_testing()
