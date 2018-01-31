include ../../plugin_tap/procedures/more.proc
include ../../plugin_utils/procedures/try.proc

@plan: 29

# This will succeed
tg = Create TextGrid: 0, 1, "test", ""
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@is_true: variableExists("try.catch"),
  ... "Catch created"

@is_true: variableExists("try.return"),
  ... "Return created"

@cmp_ok: try.catch, "!=", undefined,
  ... "Catch defined on success"

@cmp_ok: try.return, "!=", undefined,
  ... "Return defined on success"

@is_false: try.catch,
  ... "Catch is false on success"

@is_true: try.return,
  ... "Return is true on success"

@is:   fileReadable(try.tmp$), 0,
  ... "Temporary file is deleted on success"

# This will fail
nocheck removeObject: selected(), tg
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@cmp_ok: try.catch, "!=", undefined,
  ... "Catch defined on error"

@cmp_ok: try.return, "!=", undefined,
  ... "Return defined on error"

@is_false: try.return,
  ... "Return is false on error"

@is_true: try.catch,
  ... "Catch is true on error"

@is_false: fileReadable(try.tmp$),
  ... "Temporary file is deleted on error"

# This will succeed
call try
  ... tg = Create TextGrid: 0, 1, "a b", "" 'newline$'
  ... for tier to do("Get number of tiers") 'newline$'
  ...   Insert boundary: tier, 0.2          'newline$'
  ...   Insert boundary: tier, 0.4          'newline$'
  ...   Insert boundary: tier, 0.5          'newline$'
  ... endfor                                'newline$'
  ... removeObject: tg                      'newline$'

@cmp_ok: try.catch, "!=", undefined,
  ... "Catch defined on multiline success"

@cmp_ok: try.return, "!=", undefined,
  ... "Return defined on multiline success"

@is_true: try.return,
  ... "Return is true on multiline success"

@is_false: try.catch,
  ... "Catch is false on multiline success"

@is_false: fileReadable(try.tmp$),
  ... "Temporary file is deleted on multiline success"

# This will fail
call try
  ... for tier to do("Get number of tiers") 'newline$'
  ...   Insert boundary: tier, 0.2          'newline$'
  ...   Insert boundary: tier, 0.4          'newline$'
  ...   Insert boundary: tier, 0.5          'newline$'
  ... endfor                                'newline$'
  ... removeObject: tg

@is: numberOfSelected(), 0,
  ... "No objects selected from tried code"

@cmp_ok: try.catch, "!=", undefined,
  ... "Catch defined on multiline error"

@cmp_ok: try.return, "!=", undefined,
  ... "Return defined on multiline error"

@is_false: try.return,
  ... "Return is false on multiline error"

@is_true: try.catch,
  ... "Catch is true on multiline error"

@is_false: fileReadable(try.tmp$),
  ... "Temporary file is deleted on multiline error"

# This will succeed
call try
  ... Create iris example: 0, 0            'newline$'

@is:  numberOfSelected(), 3,
  ... "Multiple object selection maintained from tried code"

Remove

select all
before = numberOfSelected()

# This will fail
call try
  ... Create iris example: 0, 0            'newline$'
  ... cureCancer()                         'newline$'

select all
@is:  numberOfSelected(), before,
  ... "No objects left behind from failure"

select all
before = numberOfSelected()

# This will fail
try.remove_on_fail = 0
call try
  ... Create TextGrid: 0, 1, "test", "" 'newline$'
  ... cureCancer()                      'newline$'

select all
@cmp_ok:  numberOfSelected(), ">", before,
  ... "Objects left behind from failure"

nocheck selectObject: try.new[1]
@is$: selected$(), "TextGrid test",
  ... "Objects left behind is correct"

Remove

# This will succeed
call try
  ... Create iris example: 0, 0         \n
  ... removeObject: selected(1)         \n

@is: numberOfSelected(), 2,
  ... "Automatic newline conversion"

Remove

@ok_selection()

@done_testing()
