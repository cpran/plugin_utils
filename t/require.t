include ../../plugin_tap/procedures/more.proc
include ../procedures/require.proc
include ../procedures/try.proc

@plan: 4

call try
  ... include ../procedures/require.proc \n
  ... @require: praatVersion$            \n
@is: try.catch, 0, "no errors when requiring current version"

call try
  ... include ../procedures/require.proc \n
  ... @require: ""                       \n
@is: try.catch, 1, "cannot require an empy string"

call try
  ... include ../procedures/require.proc \n
  ... @require: "jodge the squire"       \n
@is: try.catch, 1, "cannot require a non-version string"

call try
  ... include ../procedures/require.proc \n
  ... @require: "1" + praatVersion$      \n
@isnt: try.catch, 0, "requiring higher version exits"

@done_testing()
