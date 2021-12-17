//
//  18258_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/14.
//

import Foundation

/*
얘기해볼거1. description을 쓰는 게 더 빠름
얘기해볼거2. mutating하는 struct와 class 중에서 class가 더 빠름(800ms 중후반 vs 700후반)
 */

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 {
            now = read()
        }
        if now == 45 {
            isPositive.toggle()
            now = read()
        }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readInput() -> Int {
        var now = read()
        var str = 0

        while now == 10 || now == 32 {
            now = read()
        }

        while now != 10, now != 32, now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }
}

enum InputCases: Int {
    case push = 448
    case pop = 335
    case size = 443
    case empty = 559
    case front = 553
    case back = 401
}

enum ResultCases: Int {
    case canNotFind = -1
    case notEmptied
    case emptied
}

let reader = FileIO()
let orderSize = reader.readInt()
var queue = Queue<Int>()
var result = ""

for _ in 0..<orderSize {
    let input = reader.readInput()

    switch input {
    case InputCases.push.rawValue:
        queue.insert(reader.readInt())

    case InputCases.size.rawValue:
        result += "\(queue.size.description)\n"

    case InputCases.empty.rawValue:
        if queue.isEmpty {
            result += "\(ResultCases.emptied.rawValue.description)\n"
        } else {
            result += "\(ResultCases.notEmptied.rawValue.description)\n"
        }

    case InputCases.front.rawValue:
        if let value = queue.head {
            result += "\(value.description)\n"
        } else {
            result += "\(ResultCases.canNotFind.rawValue.description)\n"
        }

    case InputCases.back.rawValue:
        if let value = queue.tail {
            result += "\(value.description)\n"
        } else {
            result += "\(ResultCases.canNotFind.rawValue.description)\n"
        }

    case InputCases.pop.rawValue:
        if let value = queue.delete() {
            result += "\(value.description)\n"
        } else {
            result += "\(ResultCases.canNotFind.rawValue.description)\n"
        }
    default:
        continue
    }
}

print(result)

struct Queue<AnyType> {
    private var linkedList = LinkedList()
    var size = 0

    var head: AnyType? {
        linkedList.head?.value
    }

    var tail: AnyType? {
        linkedList.tail?.value
    }

    var isEmpty: Bool {
        linkedList.head == nil
    }

    mutating func insert(_ value: AnyType) {
        linkedList.append(value)
        size += 1
    }

    mutating func delete() -> AnyType? {
        defer {
            if linkedList.removeFirst() {
                size -= 1
            }
        }

        return linkedList.head?.value
    }
}

// MARK: - components
extension Queue {
    private class Node {
        private(set) var value: AnyType
        var next: Node?

        init(value: AnyType) {
            self.value = value
        }
    }

    private class LinkedList {
        private(set) var head: Node?
        private(set) weak var tail: Node?

        var isEmpty: Bool {
            return head == nil
        }

        func append(_ value: AnyType) {
            let newNode = Node(value: value)

            if isEmpty {
                head = newNode
            } else {
                tail?.next = newNode
            }

            tail = newNode
        }

        func removeFirst() -> Bool {
            guard let head = head else {
                return false
            }
            self.head = head.next
            return true
        }
    }
}
