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
@isnt: fileReadable(mktempfile.return$), 0,
  ... "File was created"

deleteFile(mktempfile.return$)
@is: fileReadable(mktempfile.return$), 0,
  ... "File was removed"

@mktempfile: "", "ext"

@isnt$: mktempfile.return$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$",
  ... "Empty input uses default template with extension"
@isnt: fileReadable(mktempfile.return$), 0,
  ... "File was created"

deleteFile(mktempfile.return$)
@is: fileReadable(mktempfile.return$), 0,
  ... "File was removed"

@mktempfile: "", ".ext"

@isnt$: mktempfile.return$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$",
  ... "Empty input uses default template with extension with period"
@isnt: fileReadable(mktempfile.return$), 0,
  ... "File was created"

deleteFile(mktempfile.return$)
@is: fileReadable(mktempfile.return$), 0,
  ... "File was removed"

@find: "mktempfiletest_.*", "mktempfiletest_[a-z0-9]{7}"
@is: find.return, 0,
  ... "No file matches template"

@mktempfile: "mktempfiledirtest_XXXXXXX", "praat"
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@like: mktempfile.return$, "mktempfiledirtest_[a-z0-9]{7}.praat$",
  ... "Resulting name matches template"

deleteFile(mktempfile.return$)
@is: fileReadable(mktempfile.return$), 0,
  ... "Directory was removed"

@find: "mktempfiledirtest_.*", "mktempfiledirtest_[a-z0-9]{2}"
@is: find.return, 0,
  ... "No directories match incorrect template"

@mktempfile: "mktempfiledirtest_XX", ""
@is$: mktempfile.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is: fileReadable(mktempfile.return$), 0,
  ... "File was not created with wrong input"

@find: "mktempfiledirtest.*", "mktempfiledirtest"
@is: find.return, 0,
  ... "No files match incorrect template"

@mktempfile: "mktempfiledirtest", ""
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@is$: mktempfile.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is: fileReadable(mktempfile.return$), 0,
  ... "File was not created with wrong input"

@mktempfile: "XXXXXXXXXXXXXXXXXX", "asdasd"
@isnt$: mktempfile.name$, "",
  ... "Name is not empty string"
@isnt: fileReadable(mktempfile.return$), 0,
  ... "File was created"

deleteFile(mktempfile.return$)
@is: fileReadable(mktempfile.return$), 0,
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
