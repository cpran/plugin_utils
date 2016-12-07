include ../../plugin_tap/procedures/more.proc
include ../procedures/require.proc
include ../procedures/try.proc

@plan: 7

call try
  ... include ../procedures/require.proc      \n
  ... @require: praatVersion$                 \n
@is_false: try.catch, "no errors when requiring current version"

call try
  ... include ../procedures/require.proc      \n
  ... @require: praatVersion$ + "-label+meta" \n
@is_false: try.catch, "can require with meta data"

call try
  ... include ../procedures/require.proc      \n
  ... @require: praatVersion$ + ".2.3"        \n
@is_true: try.catch, "cannot require a non-version"

call try
  ... include ../procedures/require.proc      \n
  ... @require: ""                            \n
@is_true: try.catch, "cannot require an empty string"

call try
  ... include ../procedures/require.proc      \n
  ... @require: "tap"                         \n
@is_false: try.catch, "can require plugins"

call try
  ... include ../procedures/require.proc      \n
  ... @require: "not a plugin"                \n
@is_true: try.catch, "fails when requiring missing plugins"

call try
  ... include ../procedures/require.proc      \n
  ... @require: "1" + praatVersion$           \n
@is_true: try.catch, "requiring higher version exits"

@done_testing()
