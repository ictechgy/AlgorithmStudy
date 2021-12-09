//
//  18258_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/08.
//

import Foundation

//라이노님의 Fast FileIO
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
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
        var now = read()
        var str = 0

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10,
              now != 32,
              now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }
}

struct Queue<Element> {
    private var storage = [Element]()
    private var frontIndex = 0
    
    var size: Int {
        return storage.count - frontIndex
    }
    var isEmpty: Bool {
        return size == .zero
    }
    var front: Element? {
        if isEmpty {
            return nil
        }
        return storage[frontIndex]
    }
    var rear: Element? {
        if isEmpty {
            return nil
        }
        return storage.last
    }
    
    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        let element = storage[frontIndex]
        frontIndex += 1
        return element
    }
}

let reader = FileIO()
var queue = Queue<Int>()
let numberOfInstructions = reader.readInt()
var result = ""

for _ in Int.zero..<numberOfInstructions {
    let instruction = reader.readString()

    switch instruction {
    case 448:
        let element = reader.readInt()
        queue.enqueue(element)
    case 335:
        guard let element = queue.dequeue() else {
            result += "-1\n"
            break
        }
        result += "\(element)\n"
    case 443:
        result += "\(queue.size)\n"
    case 559:
        if queue.isEmpty {
            result += "1\n"
        } else {
            result += "0\n"
        }
    case 553:
        guard let element = queue.front else {
            result += "-1\n"
            break
        }
        result += "\(element)\n"
    case 401:
        guard let element = queue.rear else {
            result += "-1\n"
            break
        }
        result += "\(element)\n"
    default:
        break
    }
}
print(result) //출력도 모아서 한번에 해야 시간초과가 안난다..

/*
 dequeue부분을 아래와 같이 단순하게 구현하려 했으나 시간초과가 계속 발생
 1. removeFirst를 이용한 방법
 mutating func dequeue() -> Element? {
     if isEmpty {
         return nil
     }
     return storage.removeFirst() -> O(n)
 }
 
 2. suffix를 이용한 방법
 mutating func dequeue() -> Element? {
     if isEmpty {
         return nil
     }
     let element = storage[0]
     storage = Array(storage.suffix(size-1)) -> suffix 자체는 O(1)인데 ..시간초과 발생
     return element
 }
 
 3. frontIndex를 이용
 struct Queue<Element> {
     private var storage = [Element]()
     private var frontIndex = 0
     
     var size: Int {
         return storage.count - frontIndex
     }
     var isEmpty: Bool {
         return size == .zero
     }
     var front: Element? {
         if isEmpty {
             return nil
         }
         return storage[frontIndex]
     }
     var rear: Element? {
         if isEmpty {
             return nil
         }
         return storage.last
     }
     
     mutating func enqueue(_ element: Element) {
         storage.append(element)
     }
     mutating func dequeue() -> Element? {
         if isEmpty {
             return nil
         }
         let element = storage[frontIndex]
         frontIndex += 1
         return element
     }
 }
 하지만 이 방식을 이용해도 시간초과가 계속 발생하였다.
 Array 문서를 찾아본 결과 append부분에서 문제가 발생하는 것으로 판단하였다.
 일반적으로 append는 O(1)이지만, capacity를 넘어가는 경우 새 배열 공간을 할당하고 기존 배열을 복사하는 과정이 들어가 시간복잡도는 O(n)이 된다고 한다.
 따라서 배열에 대해 공간을 미리 배정하는 reserveCapacity를 써주었다.
 문제에서의 메모리제한이 512MB이므로 500MB정도를 배열 공간으로 사용하고자 하였다.
 swift에서 Int는 - 64bit 플랫폼의 경우 Int64와 같으며 Int64의 크기는 8Byte이다. 즉, 2^3Byte이고 500MB는 약 2^9 * 2^20보다 작다.
 따라서 허용가능한 크기는 2^6 * 2^20보다 작을 것이고 2^5 * 2^20을 그 크기로 주고자 하였다. 이 값은 33554432 이 된다.
 하지만 이렇게 해도 시간초과가 발생하였다. 별 숫자를 다 넣어봐도 '시간 초과 / 메모리 초과 / 런타임 에러' 발생..
 (모든 명령어가 push임을 가정하고)numberOfInstructions에 들어오는 명령어 개수 숫자 값으로 storage.reserveCapacity 설정이 이루어지도록 했음에도 시간초과가 발생하였다.
 결국 https://thoonk.tistory.com/61, https://blog.slarea.com/algorithm/baekjoon/fileio/ 를 참고하였으며
 Fast I/O 를 적용하여 해결하였다. (큐 구현 자체는 더블스택을 이용할 수도 있구나!?)
 
 4. frontIndex + reserveCapacity 이용방식(시간 초과)
 enum Instruction: String {
     case push, pop, size, empty, front, back
 }

 enum QueueStatusCode {
     static let unableToGetValueFromQueue = -1
     static let queueIsEmpty = 1
     static let queueIsNotEmpty = 0
 }

 struct Queue<Element> {
     private var storage: [Element] = {
         var storage = [Element]()
         storage.reserveCapacity(33554432)
         return storage
     }()
     private var frontIndex = 0
     
     var size: Int {
         return storage.count - frontIndex
     }
     var isEmpty: Bool {
         return size == .zero
     }
     var front: Element? {
         if isEmpty {
             return nil
         }
         return storage[frontIndex]
     }
     var rear: Element? {
         if isEmpty {
             return nil
         }
         return storage.last
     }
     
     mutating func enqueue(_ element: Element) {
         storage.append(element)
     }
     mutating func dequeue() -> Element? {
         if isEmpty {
             return nil
         }
         let element = storage[frontIndex]
         frontIndex += 1
         return element
     }
 }

 let numberOfInstructions = Int(readLine()!)!
 var queue = Queue<Int>()

 for _ in Int.zero..<numberOfInstructions {
     let userInput = readLine()!.split(separator: " ")
     let instruction = Instruction(rawValue: String(userInput[0]))!
     
     switch instruction {
     case .push:
         let element = Int(userInput[1])!
         queue.enqueue(element)
     case .pop:
         guard let element = queue.dequeue() else {
             print(QueueStatusCode.unableToGetValueFromQueue)
             break
         }
         print(element)
     case .size:
         print(queue.size)
     case .empty:
         if queue.isEmpty {
             print(QueueStatusCode.queueIsEmpty)
         } else {
             print(QueueStatusCode.queueIsNotEmpty)
         }
     case .front:
         guard let element = queue.front else {
             print(QueueStatusCode.unableToGetValueFromQueue)
             break
         }
         print(element)
     case .back:
         guard let element = queue.rear else {
             print(QueueStatusCode.unableToGetValueFromQueue)
             break
         }
         print(element)
     }
 }
 */
