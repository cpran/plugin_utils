# Rename multiple objects using regular expressions
#
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
# Copyright 2015 Jose Joaquin Atria

form Rename (regex)...
  sentence Pattern
  sentence Replacement
endform

total = numberOfSelected()
for i to total
  myobject[i] = selected(i)
endfor

for i to total
  selectObject: myobject[i]
  Rename: replace_regex$(extractWord$(selected$(), " "), pattern$, replacement$, 0)
endfor

nocheck selectObject: undefined
for i to total
  plusObject: myobject[i]
endfor
