include ../../plugin_tap/procedures/more.proc
include ../../plugin_utils/procedures/try.proc

@plan: 27

# This will succeed
tg = Create TextGrid: 0, 1, "test", ""
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@isnt: variableExists("try.catch") and variableExists("try.return"), 0,
  ... "Return variables exist on success"

@isnt: try.catch != undefined and try.return != undefined, 0,
  ... "Return variables defined on success"

@isnt: try.return, 0,
  ... "Return is true on success"

@is:   try.catch, 0,
  ... "Catch is false on success"

@is:   fileReadable(try.tmp$), 0,
  ... "Temporary file is deleted on success"

# This will fail
nocheck removeObject: selected(), tg
call try
  ... Copy: extractWord$(selected$(), " ") + "_copy"

@isnt: variableExists("try.catch") and variableExists("try.return"), 0,
  ... "Return variables exist on error"

@isnt: try.catch != undefined and try.return != undefined, 0,
  ... "Return variables defined on error"

@is:   try.return, 0,
  ... "Return is false on error"

@isnt: try.catch, 0,
  ... "Catch is true on error"

@is:   fileReadable(try.tmp$), 0,
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

@isnt: variableExists("try.catch") and variableExists("try.return"), 0,
  ... "Return variables exist on multiline success"

@isnt: try.catch != undefined and try.return != undefined, 0,
  ... "Return variables defined on multiline success"

@isnt: try.return, 0,
  ... "Return is true on multiline success"

@is:   try.catch, 0,
  ... "Catch is false on multiline success"

@is: fileReadable(try.tmp$), 0,
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

@isnt: variableExists("try.catch") and variableExists("try.return"), 0,
  ... "Return variables exist on multiline error"

@isnt: try.catch != undefined and try.return != undefined, 0,
  ... "Return variables defined on multiline error"

@is:   try.return, 0,
  ... "Return is false on multiline error"

@isnt: try.catch, 0,
  ... "Catch is true on multiline error"

@is: fileReadable(try.tmp$), 0,
  ... "Temporary file is deleted on multiline error"

# This will succeed
call try
  ... synth = Create SpeechSynthesizer: "English", "default" 'newline$'
  ... To Sound: "This is some text", "yes"                   'newline$'
  ... removeObject: synth                                    'newline$'

@is:  numberOfSelected(), 2,
  ... "Multiple object selection maintained from tried code"

Remove

# This will succeed
call try
  ... synth = Create SpeechSynthesizer: "English", "default" \n
  ... To Sound: "This is some text", "yes"                   \n
  ... removeObject: synth                                    \n

@is:  numberOfSelected(), 2,
  ... "Automatic newline conversion"

Remove

@ok_selection()

@done_testing()
