include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/utils.proc

@plan(14)

@find: "tmp.*", "tmp\.[a-z0-9]{10}"
@ok: !find.return,
  ... "No directories match default template"

@mktemp: ""

@ok: mktemp.return$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktemp.return$, "tmp\.[a-z0-9]{10}/$"),
  ... "Empty input uses default template"
@ok: fileReadable(mktemp.return$),
  ... "Directory was created"

deleteFile(mktemp.return$)
@ok: !fileReadable(mktemp.return$),
  ... "Directory was removed"

@find: "mktempdirtest_.*", "mktempdirtest_[a-z0-9]{7}"
@ok: !find.return,
  ... "No directories match template"

@mktemp: "mktempdirtest_XXXXXXX"
@ok: mktemp.name$ != "",
  ... "Name is not empty string"
@ok: index_regex(mktemp.return$, "mktempdirtest_[a-z0-9]{7}/$"),
  ... "Resulting name matches template"

deleteFile(mktemp.return$)
@ok: !fileReadable(mktemp.return$),
  ... "Directory was removed"

@find: "mktempdirtest_.*", "mktempdirtest_[a-z0-9]{2}"
@ok: !find.return,
  ... "No directories match incorrect template"

@mktemp: "mktempdirtest_XX"
@ok: mktemp.name$ == "--undefined--",
  ..."Name is undefined with wrong input"
@ok: !fileReadable(mktemp.return$),
  ... "Directory was not created with wrong input"

@find: "mktempdirtest.*", "mktempdirtest"
@ok: !find.return,
  ... "No directories match incorrect template"

@mktemp: "mktempdirtest"
@ok: mktemp.name$ != "",
  ... "Name is not empty string"
@ok: mktemp.name$ == "--undefined--",
  ..."Name is undefined with wrong input"
@ok: !fileReadable(mktemp.return$),
  ... "Directory was not created with wrong input"

@mktemp: "XXXXXXXXXXXXXXXXXX"
@ok: mktemp.name$ != "",
  ... "Name is not empty string"
@ok: fileReadable(mktemp.return$),
  ... "Directory was created"

deleteFile(mktemp.return$)
@ok: !fileReadable(mktemp.return$),
  ... "Directory was removed"

@done_testing()

procedure find: .glob$, .match$
  .dirs = Create Strings as directory list: ".", .glob$
  .n = Get number of strings
  .return = 0
  for .i to .n
    if index_regex(do$("Get string...", .i), ".*" + .match$ + ".*")
      .return = 1
    endif
  endfor
  removeObject: .dirs
endproc
