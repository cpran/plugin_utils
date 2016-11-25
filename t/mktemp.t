include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 20

@find: "tmp.*", "tmp\.[a-z0-9]{10}"
@is: find.return, 0,
  ... "No directories match default template"

@mktemp: ""

@isnt$: mktemp.return$, "",
  ... "Name is not empty string"
@like: mktemp.return$, "tmp\.[a-z0-9]{10}/$",
  ... "Empty input uses default template"
@is_true: fileReadable(mktemp.return$),
  ... "Directory was created"

deleteFile(mktemp.return$)
@is_false: fileReadable(mktemp.return$),
  ... "Directory was removed"

@find: "mktempdirtest_.*", "mktempdirtest_[a-z0-9]{7}"
@is_false: find.return,
  ... "No directories match template"

@mktemp: "mktempdirtest_XXXXXXX"
@isnt$: mktemp.name$, "",
  ... "Name is not empty string"
@like: mktemp.return$, "mktempdirtest_[a-z0-9]{7}/$",
  ... "Resulting name matches template"

deleteFile(mktemp.return$)
@is_false: fileReadable(mktemp.return$),
  ... "Directory was removed"

@find: "mktempdirtest_.*", "mktempdirtest_[a-z0-9]{2}"
@is_false: find.return,
  ... "No directories match incorrect template"

@mktemp: "mktempdirtest_XX"
@is$: mktemp.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is_false: fileReadable(mktemp.return$),
  ... "Directory was not created with wrong input"

@find: "mktempdirtest.*", "mktempdirtest"
@is_false: find.return,
  ... "No directories match incorrect template"

@mktemp: "mktempdirtest"
@isnt$: mktemp.name$, "",
  ... "Name is not empty string"
@is$: mktemp.name$, string$(undefined),
  ..."Name is undefined with wrong input"
@is_false: fileReadable(mktemp.return$),
  ... "Directory was not created with wrong input"

@mktemp: "XXXXXXXXXXXXXXXXXX"
@isnt$: mktemp.name$, "",
  ... "Name is not empty string"
@is_true: fileReadable(mktemp.return$),
  ... "Directory was created"

deleteFile(mktemp.return$)
@is_false: fileReadable(mktemp.return$),
  ... "Directory was removed"

@ok_selection()

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
