//
//  9663_Soll.swift
//  SwiftStudy
//
//  Created by Dasoll Park on 2022/02/11.
//

import Foundation

var maxLevel = 0
var columns: [Int] = []
var result = 0

func main() {
    let fileIO = FileIO()
    maxLevel = fileIO.readInt()
    columns = Array(repeating: 0, count: maxLevel + 1)
    nQueen(level: 0)
    print(result)
}

main()

// 하나의 노드에 접근
func nQueen(level: Int) -> Bool {
    if !promising(level: level) {
        return false
    } else if level == maxLevel {
        result += 1
        
        return false
    }
    for index in 1...maxLevel {
        columns[level + 1] = index
        
        // 다음 level의 노드에 접근
        if nQueen(level: level + 1) {
            return true
        }
    }
    return false
}

func promising(level: Int) -> Bool {
    if 1 < level {
        for index in 1..<level {
            if columns[index] == columns[level] {
                return false
            } else if level - index == abs(columns[level] - columns[index]) {
                return false
            }
        }
    }
    return true
}

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
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
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}
