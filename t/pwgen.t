include ../../plugin_testsimple/procedures/simple.proc
include ../procedures/utils.proc

@plan(4)

@pwgen(10)

@ok( pwgen.return$ != "",        "pwgen: string not empty" )
@ok( length(pwgen.return$) = 10, "pwgen: string has right length" )

@split_letters()
@ok( length(vowels$) == length(consonants$), "pwgen: vowel and consonat parity" )

@pwgen(9)

@split_letters()
@ok( length(vowels$) + 1 == length(consonants$), "pwgen: consonats come first" )

@done_testing()

procedure split_letters ()
  vowels$     = replace_regex$(pwgen.return$, "[^aeiou]", "", 0)
  consonants$ = replace_regex$(pwgen.return$, "[aeiou]",  "", 0)
endproc
