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

# Run tests
if fileReadable(preferencesDirectory$ + "/plugin_testsimple")
  runScript: preferencesDirectory$ + "/plugin_testsimple/scripts/run_tests.praat", defaultDirectory$ + "/tests"
else
  appendInfoLine: "W: unable to run tests for plugin_utils: testsimple not installed"
endif

# Base menu
Add menu command: "Objects", "Praat", "utils", "CPrAN", 1, ""

Add menu command: "Objects", "Praat", "Save selected objects...", "utils", 2, "management/save_all.praat"
