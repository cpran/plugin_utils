include ../../plugin_tap/procedures/more.proc
include ../procedures/require.proc
include ../procedures/try.proc

@plan: 4

call try
  ... include ../procedures/require.proc \n
  ... @require: praatVersion$            \n
@is_false: try.catch, "no errors when requiring current version"

call try
  ... include ../procedures/require.proc \n
  ... @require: ""                       \n
@is_true: try.catch, "cannot require an empty string"

call try
  ... include ../procedures/require.proc \n
  ... @require: "jodge the squire"       \n
@is_true: try.catch, "cannot require a non-version string"

call try
  ... include ../procedures/require.proc \n
  ... @require: "1" + praatVersion$      \n
@is_true: try.catch, "requiring higher version exits"

@done_testing()
