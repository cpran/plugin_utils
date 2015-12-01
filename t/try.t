include ../../plugin_testsimple/procedures/test_simple.proc
include ../../plugin_utils/procedures/try.proc

@plan(23)

# This will succeed
tg = Create TextGrid: 0, 1, "test", ""
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@ok: variableExists("try.catch") and variableExists("try.return"),
  ... "Return variables exist on success"

@ok:  try.catch != undefined and try.return != undefined,
  ... "Return variables defined on success"

@ok:  try.return,
  ... "Return is true on success"

@ok: !try.catch,
  ... "Catch is false on success"

@ok: !fileReadable(try.tmp$),
  ... "Temporary file is deleted on success"

# This will fail
nocheck removeObject: selected(), tg
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@ok: variableExists("try.catch") and variableExists("try.return"),
  ... "Return variables exist on error"

@ok:  try.catch != undefined and try.return != undefined,
  ... "Return variables defined on error"

@ok: !try.return,
  ... "Return is false on error"

@ok:  try.catch,
  ... "Catch is true on error"

@ok: !fileReadable(try.tmp$),
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

@ok: variableExists("try.catch") and variableExists("try.return"),
  ... "Return variables exist on multiline success"

@ok:  try.catch != undefined and try.return != undefined,
  ... "Return variables defined on multiline success"

@ok:  try.return,
  ... "Return is true on multiline success"

@ok: !try.catch,
  ... "Catch is false on multiline success"

@ok: !fileReadable(try.tmp$),
  ... "Temporary file is deleted on multiline success"

# This will fail
call try
  ... for tier to do("Get number of tiers") 'newline$'
  ...   Insert boundary: tier, 0.2          'newline$'
  ...   Insert boundary: tier, 0.4          'newline$'
  ...   Insert boundary: tier, 0.5          'newline$'
  ... endfor                                'newline$'
  ... removeObject: tg

@ok: !numberOfSelected(),
  ... "No objects selected from tried code"

@ok: variableExists("try.catch") and variableExists("try.return"),
  ... "Return variables exist on multiline error"

@ok:  try.catch != undefined and try.return != undefined,
  ... "Return variables defined on multiline error"

@ok: !try.return,
  ... "Return is false on multiline error"

@ok:  try.catch,
  ... "Catch is true on multiline error"

@ok: !fileReadable(try.tmp$),
  ... "Temporary file is deleted on multiline error"

# This will succeed
call try
  ... synth = Create SpeechSynthesizer: "English", "default" 'newline$'
  ... To Sound: "This is some text", "yes"                   'newline$'
  ... removeObject: synth                                    'newline$'

@ok: numberOfSelected() == 2,
  ... "Multiple object selection maintained from tried code"

Remove

# This will succeed
call try
  ... synth = Create SpeechSynthesizer: "English", "default" \n
  ... To Sound: "This is some text", "yes"                   \n
  ... removeObject: synth                                    \n

@ok: numberOfSelected() == 2,
  ... "Automatic newline conversion"

Remove

@done_testing()
