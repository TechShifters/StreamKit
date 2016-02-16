
public protocol Stream {
    func read(maxBytes: Int) throws -> [UInt8]
    func write(bytes: [UInt8]) throws -> Int
    func close() throws
}

public extension Stream {
    func readInt8() throws -> Int8 {
        return Int8(try read(1)[0])
    }
    
    func write(int8: Int8) throws {
        try write([UInt8(int8)])
    }
    
    func readUInt8() throws -> UInt8 {
        return try read(1)[0]
    }
    
    func write(uint8: UInt8) throws {
        try write([uint8])
    }
}

public func >> (left: Stream, inout right: UInt8) throws {
    right = try left.readUInt8()
}

public func >> (left: Stream, inout right: Int8) throws {
    right = try left.readInt8()
}

public func << (left: Stream, right: UInt8) throws {
    try left.write(right)
}

public func << (left: Stream, right: Int8) throws {
    try left.write(right)
}