import Foundation

final class BitReader {
    private var data: Data
    private var byteOffset = 0
    private var bitOffset = 0

    init(data: Data) {
        self.data = data
    }

    func readBit() throws -> Bool {
        guard byteOffset < data.count else {
            throw "Out of data"
        }
        let mask = UInt8(1 << (7 - bitOffset))
        let value = (data[byteOffset] & mask) == mask
        bitOffset += 1
        if bitOffset == 8 {
            bitOffset = 0
            byteOffset += 1
        }
        return value
    }

    func readBits(count: Int) throws -> UInt8 {
        var value: UInt8 = 0
        for _ in 0 ..< count {
            value <<= 1
            value |= try readBit() ? 1 : 0
        }
        return value
    }

    func readBitsU32(count: Int) throws -> UInt32 {
        var value: UInt32 = 0
        for _ in 0 ..< count {
            value <<= 1
            value |= try readBit() ? 1 : 0
        }
        return value
    }
}
