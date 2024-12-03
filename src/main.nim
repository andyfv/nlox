import chunk, debug

proc main =
    var chunk: Chunk = Chunk();
    var constant : int = addConstant(chunk, 1.2)

    writeChunk(chunk = chunk, byte = OP_CONSTANT)
    writeChunk(chunk = chunk, byte = constant)

    disassembleChunk(chunk = chunk, name = "test chunk")

main()