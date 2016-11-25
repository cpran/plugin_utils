include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

prefix$ = "name_"
suffix$ = "_number"
group = 10

@plan: 17

@test: 1, suffix$, ""
@test: group, suffix$, ""

@test: 1, prefix$, ""
@test: group, prefix$, ""

@test: 1, "_([2468])_", "\1_\1"
@test: group, "_([2468])_", "\1_\1"

@test: 1, "^" + suffix$, "impossible"
@test: group, prefix$ + "$", "impossible"

@ok_selection()

@done_testing()

procedure test: .length, .search$, .replace$
  for i to .length
    name$[i] = prefix$ + string$(i) + suffix$
    textgrid[i] = Create TextGrid: 0, 1, name$[i], ""
  endfor

  nocheck selectObjet: undefined
  for i to .length
    plusObject: textgrid[i]
  endfor

  runScript: "../scripts/rename_regex.praat", .search$, .replace$

  @is: numberOfSelected(), .length,
    ... "renamed " + if .length == 1 then "object" else "group" fi +
    ... " is selected"

  .good = 1
  for i to .length
    .got$      = extractWord$(selected$(i), " ")
    .expected$ = replace_regex$(name$[i], .search$, .replace$, 0)
    if .got$ != .expected$
      .good = 0
    endif
  endfor

  @is_true: .good,
    ... "rename replaced """ + .search$ +
    ... """ with """ + .replace$ + """ from " +
    ... if .length == 1 then "a single object" else "multiple objects" fi

  nocheck selectObjet: undefined
  for i to .length
    removeObject: textgrid[i]
  endfor
endproc
