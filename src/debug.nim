from std/strformat import fmt

import chunk 
import value

proc disassembleInstruction*(chunk: Chunk, offset: var int) : int

###############################################################################
proc disassembleChunk*(chunk: Chunk, name: string) =
    echo "== " , name, " =="
    
    var offset: int = 0
    while offset < chunk.code.len: 
        offset = disassembleInstruction(chunk, offset)

###############################################################################
proc simpleInstruction(name: string, offset: var int) : int = 
    echo name
    inc(offset)
    return offset

###############################################################################
proc constantInstruction(name: string, chunk: Chunk, offset: var int) : int =
    var constant : Byte = chunk.code[offset + 1]
    stdout.write fmt"{name:16} "
    stdout.write fmt"{offset:4} "
    printValue(chunk.constants[constant])
    echo "\n"

    return offset + 2   # Return the offset to the next instruction.
                        # The offset is (+ 2) because the first byte
                        # is for the opCode and the second for the operand.

###############################################################################
proc disassembleInstruction*(chunk: Chunk, offset: var int) : int =
    # format as a single byte and without a newline #
    stdout.write fmt"{offset:04} "

    var instruction: OpCode = OpCode(chunk.code[offset])

    case instruction
    of OP_CONSTANT:
        return constantInstruction($instruction, chunk, offset)
    of OP_RETURN: 
        return simpleInstruction($instruction, offset)
    else: 
        echo "Unknown opcode: " , instruction
        inc(offset)
        return offset