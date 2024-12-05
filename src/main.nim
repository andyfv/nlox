import chunk, debug, vm


proc main =
    # initVM()

    var chunk: Chunk = Chunk();
    var constant: int = addConstant(chunk, 1.2)

    writeChunk(chunk = chunk, byte = OP_CONSTANT, line = 123)
    writeChunk(chunk = chunk, byte = constant, line = 123)

    writeChunk(chunk = chunk, byte = OP_RETURN, line = 123)

    disassembleChunk(chunk = chunk, name = "test chunk")


##### Run main ##### 
main()