include ../../plugin_tap/procedures/more.proc
include ../procedures/utils.proc

@no_plan()

@zeropad: undefined, 5
@is$: zeropad.return$, string$(undefined),
  ... "undefined returns undefined"

@zeropad: 14, 5
@is$: zeropad.return$, "00014",
  ... "padded positive integer"

@zeropad: -14, 5
@is$: zeropad.return$, "-00014",
  ... "padded negative integer"

@zeropad: 0.5, 5
@is$: zeropad.return$, "000.5",
  ... "padded positive real"

@zeropad: -2.5, 5
@is$: zeropad.return$, "-002.5",
  ... "padded negative real"

@zeropad: 153, 2
@is$: zeropad.return$, "153",
  ... "padding does not lose significant digits"

@zeropad: 1e-5, 7
@is$: zeropad.return$, "001e-05",
  ... "padded scientific notation"

@done_testing()
