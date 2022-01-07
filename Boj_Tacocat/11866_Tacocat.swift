//
//  11866_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/15.
//

import Foundation
/*
 이 문제는 큐를 이용해서 인큐와 디큐를 반복하는 문제
 1. 큐에 입력값 만큼의 1씩 증가하는 숫자 큐 만들기
 2. 두번째 입력값 보다 하나 작은 수 만큼 디큐 진행하고 해당 수를 인큐
 3. 가장 앞의 수를 디큐하여 결과값에 추가
 */

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
class Queue<Value> {
    var storage : [Value] = []
    
    func enqueue(value: Value) {
        storage.append(value)
    }
    
    func dequeue() -> Value? {
        storage.removeFirst()
    }
    
    func empty() {
        storage =  []
    }
    
    func front() -> Value? {
        storage.first
    }
    
    func back() -> Value? {
        storage.last
    }
    
    func size() -> Int? {
        storage.count
    }
}

let reader = FileIO()

let first = reader.readInt()
let queue = Queue<Int>()
var result: [Int] = []

for i in 1...first {
    queue.enqueue(value: i)
}

if queue.storage.count == 1 {
    result.append(first)
}

let second = reader.readInt()

while queue.back()! - queue.front()! != 0 {
    if second == 1 {
        queue.storage.map { number in
            result.append(number)
        }
        break
    } else {
        // term에 해당하는 것 까지 디큐해서 인큐하기
        for _ in 1...second - 1 {
            queue.enqueue(value: queue.dequeue()!)
        }
        result.append(queue.dequeue() ?? .zero)
    }
    
    if queue.storage.count == 1 {
        result.append(queue.front() ?? .zero)
    }
}

print("<" + result.map{ $0.description }.joined(separator: ", ") + ">")
