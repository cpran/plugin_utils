include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@plan: 5

@pwgen: 10

@isnt$: pwgen.return$,         "", "string not empty"
@is:    length(pwgen.return$), 10, "string has right length"

@split_letters()
@is: length(vowels$), length(consonants$), "vowel and consonant parity"

@pwgen: 9

@split_letters()
@is: length(vowels$) + 1, length(consonants$), "consonants come first"

@ok_selection()

@done_testing()

procedure split_letters ()
  vowels$     = replace_regex$(pwgen.return$, "[^aeiou]", "", 0)
  consonants$ = replace_regex$(pwgen.return$, "[aeiou]",  "", 0)
endproc
