include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 28

@find: "tmp.*", "tmp\.[a-z0-9]{10}"
@is: find.return, 0,
  ... "No file matches default template"

@mktempfile: "", ""

@isnt$: mktempfile.return$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "tmp\.[a-z0-9]{10}$",
  ... "Empty input uses default template without extension"
@is_true: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@is_false: fileReadable(mktempfile.return$),
  ... "File was removed"

@mktempfile: "", "ext"

@isnt$: mktempfile.return$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$",
  ... "Empty input uses default template with extension"
@is_true: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@is_false: fileReadable(mktempfile.return$),
  ... "File was removed"

@mktempfile: "", ".ext"

@isnt$: mktempfile.return$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$",
  ... "Empty input uses default template with extension with period"
@is_true: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@is_false: fileReadable(mktempfile.return$),
  ... "File was removed"

@find: "mktempfiletest_.*", "mktempfiletest_[a-z0-9]{7}"
@is_false: find.return,
  ... "No file matches template"

@mktempfile: "mktempfiledirtest_XXXXXXX", "praat"
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "mktempfiledirtest_[a-z0-9]{7}.praat$",
  ... "Resulting name matches template"

deleteFile(mktempfile.return$)
@is_false: fileReadable(mktempfile.return$),
  ... "Directory was removed"

@find: "mktempfiledirtest_.*", "mktempfiledirtest_[a-z0-9]{2}"
@is_false: find.return,
  ... "No directories match incorrect template"

@mktempfile: "mktempfiledirtest_XX", ""
@is$: mktempfile.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is_false: fileReadable(mktempfile.return$),
  ... "File was not created with wrong input"

@find: "mktempfiledirtest.*", "mktempfiledirtest"
@is_false: find.return,
  ... "No files match incorrect template"

@mktempfile: "mktempfiledirtest", ""
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@is$: mktempfile.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is_false: fileReadable(mktempfile.return$),
  ... "File was not created with wrong input"

@mktempfile: "XXXXXXXXXXXXXXXXXX", "asdasd"
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@is_true: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@is_false: fileReadable(mktempfile.return$),
  ... "Directory was removed"

@ok_selection()

@done_testing()

procedure find: .glob$, .match$
  .dirs = Create Strings as file list: ".", .glob$
  .n = Get number of strings
  .return = 0
  for .i to .n
    if index_regex(do$("Get string...", .i), ".*" + .match$ + ".*")
      .return = 1
    endif
  endfor
  removeObject: .dirs
endproc
