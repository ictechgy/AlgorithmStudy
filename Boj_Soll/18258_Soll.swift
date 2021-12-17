//
//  18258_Soll.swift
//  SwiftStudy
//
//  Created by Dasoll Park on 2021/12/17.
//

import Foundation

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
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10 &&
              now != 32 &&
              now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}

class Queue {
    var left = [Int]()
    var right = [Int]()
    
    var size: Int {
        left.count + right.count
    }
    
    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    
    var first: Int? {
        guard !isEmpty else { return -1 }
        return right.isEmpty ? left.first : right.last
    }
    
    var last: Int? {
        guard !isEmpty else { return -1 }
        return left.isEmpty ? right.first : left.last
    }
    
    func enqueue(value: Int) {
        left.append(value)
    }
    
    func dequeue() -> Int? {
        guard !isEmpty else { return -1 }
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
    
    func front() -> Int {
        queue.isEmpty ? -1 : queue.first!
    }
    
    func back() -> Int {
        queue.isEmpty ? -1 : queue.last!
    }
}

let fileIO = FileIO()
let queue = Queue()
var result = ""

for _ in 0 ..< fileIO.readInt() {
    let command = fileIO.readString()
    
    if command == 448 {
        queue.enqueue(value: fileIO.readInt())
    } else if command == 335 {
        result += queue.isEmpty ? "-1\n" : "\(queue.dequeue()!)\n"
    } else if command == 443 {
        result += "\(queue.size)\n"
    } else if command == 559 {
        result += queue.isEmpty ? "1\n" : "0\n"
    } else if command == 553 {
        result += "\(queue.front())\n"
    } else if command == 401 {
        result += "\(queue.back())\n"
    }
}
print(result)
