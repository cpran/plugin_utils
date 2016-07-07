include ../../plugin_tap/procedures/more.proc
include ../procedures/require.proc
include ../procedures/try.proc

@plan: 5

@compareSemVer: praatVersion$, praatVersion$
@is: compareSemVer.newer, 0, "check same version"

@compareSemVer: "5.0", praatVersion$
@cmp_ok: compareSemVer.newer, ">", 0, "first term is older"

@compareSemVer: praatVersion$, "5.0"
@cmp_ok: compareSemVer.newer, "<", 0, "second term is older"

call try
  ... include ../procedures/require.proc \n
  ... @require: praatVersion$            \n
@is: try.catch, 0, "no errors when requiring current version"

call try
  ... include ../procedures/require.proc \n
  ... @require: "1" + praatVersion$      \n
@isnt: try.catch, 0, "requiring higher version exits"

@done_testing()
