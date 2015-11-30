include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/base_conversions.proc

@no_plan()

@dec2hex: 255
@ok_formula: "dec2hex.n$ == ""ff""", "dec2hex (positive integer)"

@dec2hex: -255
@ok_formula: "dec2hex.n$ == ""-ff""", "dec2hex (negative integer)"

@dec2hex: 57.9
@ok_formula: "left$(dec2hex.n$, 8) == ""39.e6666""", "dec2hex (positive rational)"

@dec2hex: -57.9
@ok_formula: "left$(dec2hex.n$, 9) == ""-39.e6666""", "dec2hex (negative rational)"

@hex2dec: "ff"
@ok_formula: "hex2dec.n = 255", "hex2dec (positive integer)"

@hex2dec: "-ff"
@ok_formula: "hex2dec.n = -255", "hex2dec (negative integer)"

@hex2dec: "18.8"
@ok_formula: "hex2dec.n = 24.5", "hex2dec (positive rational)"

@hex2dec: "-18.8"
@ok_formula: "hex2dec.n = -24.5", "hex2dec (negative rational)"

@dec2oct: 16
@ok_formula: "dec2oct.n$ = ""20""", "dec2oct (positive integer)"

@dec2oct: -32
@ok_formula: "dec2oct.n$ = ""-40""", "dec2oct (negative integer)"

@dec2oct: 0.9999
@ok_formula: "left$(dec2oct.n$, 6) = ""0.7777""", "dec2oct (positive rational)"

@dec2oct: -7.9999
@ok_formula: "left$(dec2oct.n$, 7) = ""-7.7777""", "dec2oct (negative rational)"

@oct2dec: "20"
@ok_formula: "oct2dec.n = 16", "oct2dec (positive integer)"

@oct2dec: "-40"
@ok_formula: "oct2dec.n = -32", "oct2dec (negative integer)"

@oct2dec: "0.7777777"
@ok_formula: "oct2dec.n - 0.99999 < 0.001", "oct2dec (positive rational)"

@oct2dec: "-12.336"
@ok_formula: "fixed$(oct2dec.n, 2) = ""-10.43""", "oct2dec (negative rational)"

@dec2bin: 16
@ok_formula: "dec2bin.n$ = ""10000""", "dec2bin (positive integer)"

@dec2bin: -15
@ok_formula: "dec2bin.n$ = ""-1111""", "dec2bin (negative integer)"

@dec2bin: 3.1415926
@ok_formula: "left$(dec2bin.n$, 10) = ""11.0010010""", "dec2bin (positive rational)"

@dec2bin: -3.1415926
@ok_formula: "left$(dec2bin.n$, 10) = ""-11.001001""", "dec2bin (negative rational)"

@bin2dec: "11.00100100001111110110100110100010010110"
@ok_formula: "bin2dec.n - 3.14159 < 0.0001", "bin2dec (positive integer)"

@bin2dec: "-10"
@ok_formula: "bin2dec.n = -2", "bin2dec (negative integer)"

@bin2dec: "0.10011001"
@ok_formula: "bin2dec.n - 0.5976 < 0.001", "bin2dec (positive rational)"

@bin2dec: "-11.00001"
@ok_formula: "oct2dec.n - -3.03125 < 0.001", "oct2dec (negative rational)"

@parseHex: "ff"
@ok_formula: "parseHex.n = 255", "parseHex"

@done_testing()
