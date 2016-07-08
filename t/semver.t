include ../../plugin_tap/procedures/more.proc
include ../procedures/require.proc

@plan: 25

@semver: "1"
@is:  semver.v[1],   1,       "major release"
@is:  semver.v[2],   0,       "default minor release"
@is:  semver.v[3],   0,       "default patch"
@is$: semver.label$, "",      "no label"
@is$: semver.meta$,  "",      "no meta"

@semver: "01"
@is:  semver.v[1],   1,       "no trailing zeroes"

@semver: "1.2"
@is:  semver.v[2],   2,       "minor release"

@semver: "1.2.30"
@is:  semver.v[3],   30,      "patch"

@semver: "1.2.30-label"
@is$: semver.label$, "label", "label"
@is$: semver.meta$,  "",      "no meta"

@semver: "1.2.30+meta"
@is$: semver.label$, "",      "no label"
@is$: semver.meta$,  "meta",  "meta"

@semver: "1.2.30-label+meta"
@is$: semver.label$, "label", "label"
@is$: semver.meta$,  "meta",  "meta"

@semver: "1.2.30-label-with-hyphens+0.34.asd.z"
@is$: semver.label$, "label-with-hyphens", "label with hyphens"
@is$: semver.meta$,  "0.34.asd.z",         "complex meta"

@semver_compare: "1", "2"
@is: semver_compare.return,  1, "only majors, second is greater"

@semver_compare: "2", "1"
@is: semver_compare.return, -1, "only majors, first is greater"

@semver_compare: "12.3.2", "12.3.2"
@is: semver_compare.return,  0, "same version"

@semver_compare: "12.3.2+zzz", "12.3.2+aaa"
@is: semver_compare.return,  0, "same version, different meta"

@semver_compare: "12.3.2-aaa", "12.3.2-zzz"
@is: semver_compare.return,  1, "same version, different label"

@semver_compare: "12.3.2-zzz+aaa", "12.3.2-aaa+zzz"
@is: semver_compare.return, -1, "same version, different label with meta"

@semver_compare: "12.3.2-aaa", "12.3.3"
@is: semver_compare.return,  1, "only one with label"

@semver_compare: "12.3.2-aaa", "12.3.2"
@is: semver_compare.return,  1, "no label comes first"

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
