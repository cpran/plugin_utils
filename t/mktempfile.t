include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/utils.proc

@plan(27)

@find: "tmp.*", "tmp\.[a-z0-9]{10}"
@ok: !find.return,
  ... "No file matches default template"

@mktempfile: "", ""

@ok: mktempfile.return$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktempfile.return$, "tmp\.[a-z0-9]{10}$"),
  ... "Empty input uses default template without extension"
@ok: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@ok: !fileReadable(mktempfile.return$),
  ... "File was removed"

@mktempfile: "", "ext"

@ok: mktempfile.return$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$"),
  ... "Empty input uses default template with extension"
@ok: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@ok: !fileReadable(mktempfile.return$),
  ... "File was removed"

@mktempfile: "", ".ext"

@ok: mktempfile.return$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktempfile.return$, "tmp\.[a-z0-9]{10}\.ext$"),
  ... "Empty input uses default template with extension with period"
@ok: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@ok: !fileReadable(mktempfile.return$),
  ... "File was removed"

@find: "mktempfiletest_.*", "mktempfiletest_[a-z0-9]{7}"
@ok: !find.return,
  ... "No file matches template"

@mktempfile: "mktempfiledirtest_XXXXXXX", "praat"
@ok: mktempfile.name$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktempfile.return$, "mktempfiledirtest_[a-z0-9]{7}.praat$"),
  ... "Resulting name matches template"

deleteFile(mktempfile.return$)
@ok: !fileReadable(mktempfile.return$),
  ... "Directory was removed"

@find: "mktempfiledirtest_.*", "mktempfiledirtest_[a-z0-9]{2}"
@ok: !find.return,
  ... "No directories match incorrect template"

@mktempfile: "mktempfiledirtest_XX", ""
@ok: mktempfile.name$ == "--undefined--",
  ..."Name is undefined with wrong input"
@ok: !fileReadable(mktempfile.return$),
  ... "File was not created with wrong input"

@find: "mktempfiledirtest.*", "mktempfiledirtest"
@ok: !find.return,
  ... "No files match incorrect template"

@mktempfile: "mktempfiledirtest", ""
@ok: mktempfile.name$ != "",
  ... "Name is not empty string"
@ok: mktempfile.name$ == "--undefined--",
  ..."Name is undefined with wrong input"
@ok: !fileReadable(mktempfile.return$),
  ... "File was not created with wrong input"

@mktempfile: "XXXXXXXXXXXXXXXXXX", "asdasd"
@ok: mktempfile.name$ != "",
  ... "Name is not empty string"
@ok: fileReadable(mktempfile.return$),
  ... "File was created"

deleteFile(mktempfile.return$)
@ok: !fileReadable(mktempfile.return$),
  ... "Directory was removed"

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
