include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 19

string$ = ""
@split: "",  string$
@is:  split.length, 1,
  ... "split empty string with empty string"
@is$: split.return$[1], string$,
  ... "returned empty string"

@split: ",", string$
@is:  split.length, 1,
  ... "split empty string with separator"
@is$: split.return$[1], string$,
  ... "returned empty string"

string$ = "apple"
@split: "",  string$
@is:  split.length,     length(string$),
  ... "one chunk per character with empty separator"

@test: string$
@is_true: test.pass,
  ... "empty separator splits at every char"

@split: ",", string$
@is:  split.length, 1,
  ... "split string with missing separator"
@is$: split.return$[1], string$,
  ... "returned same string"

string$ = "a,b,c"
@split: ",", string$
@is:  split.length, 3,
  ... "split string with existing separator"

@test: "abc"
@is_true: test.pass,
  ... "returned good chunks"

string$ = ",,,"
@split: ",", string$
@is:  split.length, 4,
  ... "split string of separators"

@test: ""
@is_true: test.pass,
  ... "returned empty chunks"

string$ = "a--b--c"
@split: "--", string$
@is:  split.length, 3,
  ... "split string with multi-character separator"

string$ = "a b c"
@split: " ", string$
@is:  split.length, 3,
  ... "split string with whitespace separator"

@test: "abc"
@is_true: test.pass,
  ... "returned good chunks"

string$ = "a,b,c"
split.stop_at = 2
@split: ",", string$
@is:  split.length, 2,
  ... "interrupted splitting"
@is$: split.return$[2], "b,c",
  ... "reset stop variable"
@is:  split.stop_at, 0,
  ... "reset stop variable"

@ok_selection()

@done_testing()

procedure test: .str$
  .pass = 1
  for i to split.length
    if split.return$[i] != mid$(.str$, i, 1)
      @trace: ">" + split.return$[i] + "<   >" + mid$(.str$, i, 1) + "<"
      .pass = 0
    endif
  endfor
endproc
