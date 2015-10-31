include ../../plugin_testsimple/procedures/test_simple.proc
include ../../plugin_utils/procedures/utils.proc

clearinfo
@normalPrefDir()

prefix$ = "name_"
suffix$ = "_number"
group = 10

@no_plan()

@try: 1, suffix$, ""
@try: group, suffix$, ""

@try: 1, prefix$, ""
@try: group, prefix$, ""

@try: 1, "_([2468])_", "\1_\1"
@try: group, "_([2468])_", "\1_\1"

@try: 1, "^" + suffix$, "impossible"
@try: group, prefix$ + "$", "impossible"

@done_testing()

procedure try: .length, .search$, .replace$
  for i to .length
    name$[i] = prefix$ + string$(i) + suffix$
    textgrid[i] = Create TextGrid: 0, 1, name$[i], ""
  endfor

  nocheck selectObjet: undefined
  for i to .length
    plusObject: textgrid[i]
  endfor

  runScript: preferencesDirectory$ + "/plugin_utils/scripts/rename_regex.praat",
    ... .search$, .replace$

  @ok_formula: "numberOfSelected() == " + string$(.length), "renamed " +
    ... if .length == 1 then "object" else "group" fi + " is selected"
  .good = 1
  for i to .length
    if replace_regex$(name$[i], .search$, .replace$, 0) != extractWord$(selected$(i), " ")
      .good = 0
    endif
    #appendInfoLine: extractWord$(selected$(), " ")
  endfor
  @ok: .good, "rename replaced """ + .search$ + """ with """ + .replace$ + """ from " +
    ... if .length == 1 then "single object" else "multiple objects" fi

  nocheck selectObjet: undefined
  for i to .length
    removeObject: textgrid[i]
  endfor
endproc
