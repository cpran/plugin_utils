# This script is part of the utils CPrAN plugin for Praat.
# The latest version is available through CPrAN or at
# <http://cpran.net/plugins/utils>
#
# The utils plugin is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
#
# The utils plugin is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with utils. If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2012, 2016 Jose Joaquin Atria

#! ~~~ params
#! in:
#!   Precision: >
#!     (integer) Number of precision digits for numeric fields
#!   Suffix: >
#!     (word) Suffix for the name of the new Table object. If
#!     suffix is empty, changes will be made inline.
#!   Ignore: >
#!     (sentence) A list of column names to skip, separated by
#!     spaces
#! ~~~
#!
#! Simplifies the numeric contents of a Table object to an
#! arbitrary degree of precision.
#!
form Simplify Table...
  integer Precision 2
  word Suffix _simple
  sentence Ignore
endform

ignore$ = " " + ignore$ + " "

tables = numberOfSelected("Table")
for i to tables
  table[i] = selected("Table", i)
endfor

tors = numberOfSelected("TableOfReal")
for i to tors
  table[tables+i] = selected("TableOfReal", i)
endfor

n = tors + tables

for i to n
  selectObject: table[i]
  table$ = extractWord$(selected$(), " ")
  if suffix$ != ""
    table = Copy: table$ + suffix$
  else
    table = table[i]
  endif

  rows = Object_'table'.nrow
  cols = Object_'table'.ncol

  for row to rows
    for col to cols
      col$ = Get column label: col

      if col$ != "" and !index(ignore$, col$)
        number = Object_'table'[row, col$]

        if number != undefined
          number$ = fixed$(number, precision)

          if extractWord$(selected$(), "") == "Table"
            Set string value: row, col$, number$
          else
            Set value: row, col, number(number$)
          endif
        endif
      endif
    endfor
  endfor

  new[i] = table
endfor

nocheck selectObject: undefined
for i to n
  plusObject: new[i]
endfor
