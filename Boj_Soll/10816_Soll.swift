//
//  10816_Soll.swift
//  AlgorithmStudy
//
//  Created by Dasoll Park on 2021/12/23.
//

import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let fileIO = FileIO()

let n = fileIO.readInt()
var inputN = [Int]()
for _ in 0..<n { inputN.append(fileIO.readInt()) }

let m = fileIO.readInt()
var inputM = [Int]()
for _ in 0..<m { inputM.append(fileIO.readInt()) }

var arrayM: [Int : Int] = [:]

for index in 0..<n {
    if var _ = arrayM[inputN[index]] {
        arrayM[inputN[index]]! += 1
        continue
    }
    arrayM[inputN[index]] = 1
}

for item in inputM {
    print(arrayM[item] ?? 0, terminator: " ")
}
