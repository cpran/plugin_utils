# Setup script for utils
#
# Find the latest version of this plugin at
# https://gitlab.com/cpran/plugin_utils
#
# Written by Jose Joaquín Atria
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# A copy of the GNU General Public License is available at
# <http://www.gnu.org/licenses/>.

## Static commands:

# Base menu
nocheck Add menu command... "Objects" "Praat" "utils" "CPrAN" 1

nocheck Add menu command... "Objects" "Praat" "Save selected objects..." "utils" 2 scripts/save_all.praat
nocheck Add menu command... "Objects" "Praat" "Rename (regex)..." "utils" 2 scripts/rename_regex.praat
