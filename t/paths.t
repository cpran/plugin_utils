include ../../plugin_utils/procedures/try.proc
include ../../plugin_tap/procedures/more.proc
include ../procedures/paths.proc

@no_plan()

@basename: "test"
@is$: basename.return$, "test", "basename from string"

@basename: ""
@is$: basename.return$, "", "basename from empty string"

@dirname: ""
@is$: dirname.return$, "", "dirname from empty string"

@diag: "Unix paths"

bkp = windows
windows = 0

path$ = "/home/user/test"

@is_absolute: path$
@is_true: is_absolute.return, "absolute path is absolute"

@is_relative: path$
@is_false: is_relative.return, "absolute path is not relative"

@basename: path$
@is$: basename.return$, "test", "basename from absolute path"

@dirname: path$
@is$: dirname.return$, "/home/user", "dirname from absolute path"

path$ = "home/user/test"

@is_absolute: path$
@is_false: is_absolute.return, "relative path is not absolute"

@is_relative: path$
@is_true: is_relative.return, "relative path is relative"

@basename: path$
@is$: basename.return$, "test", "basename from relative path"

@dirname: path$
@is$: dirname.return$, "home/user", "dirname from relative path"

@diag: "Windows paths"

windows = 1

path$ = "C:\home\user\test"

@is_absolute: path$
@is_true: is_absolute.return, "absolute path is absolute"

@is_relative: path$
@is_false: is_relative.return, "absolute path is not relative"

@basename: path$
@is$: basename.return$, "test", "basename from absolute path"

@dirname: path$
@is$: dirname.return$, "C:/home/user", "dirname from absolute path"

path$ = "home\user\test"

@is_absolute: path$
@is_false: is_absolute.return, "relative path is not absolute"

@is_relative: path$
@is_true: is_relative.return, "relative path is relative"

@basename: path$
@is$: basename.return$, "test", "basename from relative path"

@dirname: path$
@is$: dirname.return$, "home/user", "dirname from relative path"

@ok_selection()

@done_testing()
