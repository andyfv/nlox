import value as v

type Byte* = uint8

type
    OpCode* {.size: sizeof(Byte).} = enum
        OP_CONSTANT     # Takes a single byte operand to specify which constant to load
        OP_RETURN
        

type Chunk* = ref object of RootObj
    code*       : seq[Byte]
    constants*  : ValueArray

proc writeChunk* (chunk: Chunk, byte: (int | OpCode) ) : void =
    chunk.code.add(Byte(byte))

proc addConstant*(chunk: Chunk, value: Value) : int = 
    writeValueArray(chunk.constants, value)
    return chunk.constants.len - 1