//
//  10816_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/04.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10 || now == 32 { now = read() }

        while now != 10 && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

let reader = FileIO()

let baskectLength = reader.readInt()
var cardBasket = [Int]()

for _ in 0..<baskectLength {
    cardBasket.append(reader.readInt())
}

let handsLength = reader.readInt()
var hands = [Int]()

for _ in 0..<handsLength {
    hands.append(reader.readInt())
}


var result = ""
var countAbout = [Int: Int]()

cardBasket.forEach { card in
    if let count = countAbout[card] {
        countAbout[card] = count + 1
    } else {
        countAbout[card] = 1
    }
}

hands.forEach { card in
    if let count = countAbout[card] {
        result += "\(count) "
    } else {
        result += "0 "
    }
}

print(result)

