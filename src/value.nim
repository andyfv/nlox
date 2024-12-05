from std/strformat import fmt

type Value*      = float64
type ValueArray* = seq[Value]

proc writeValueArray*(array: var ValueArray, value: Value) : void = 
    array.add(value)

proc printValue*(value: Value) : void =
    stdout.write fmt"{value:g}"