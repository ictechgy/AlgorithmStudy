//
//  11866_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/15.
//
import Foundation

if let input = readLine()?.split(separator: " "),
   let desiredLength = Int(input[0]),
   let term = Int(input[1]) {
    //setting
    var result = [Int]()
    var queue = Queue<Int>()
    for int in 1...desiredLength {
        queue.insert(int)
    }

    //solution
    var index = 0
    while result.count < desiredLength {
        index += 1

        if let element = queue.delete() {
            if index % term == 0 {
                result.append(element)
                index = 0
            } else {
                queue.insert(element)
            }
        }
    }

    print(result.reduce("<") { $0 + $1.description + ", "}.dropLast(2) + ">")
}




struct Queue<AnyType> {
    private var linkedList = LinkedList()
    private(set) var size = 0

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
        weak var prev: Node?
        var next: Node?

        init(value: AnyType, next: Node? = nil) {
            self.value = value
        }

        func updateValue(by value: AnyType) {
            self.value = value
        }
    }

    private struct LinkedList {
        private(set) var head: Node?
        private(set) weak var tail: Node?

        var isEmpty: Bool {
            return head == nil
        }

        mutating func append(_ value: AnyType) {
            let newNode = Node(value: value)

            if isEmpty {
                head = newNode
            } else {
                tail?.next = newNode
                newNode.prev = tail
            }

            tail = newNode
        }

        var target: Node? {
            return head?.next
        }

        mutating func removeFirst() -> Bool {
            if head != nil {
                head = head?.next
                return true
            } else {
                return false
            }
        }

        init() { }

        init(headValue: AnyType) {
            self.append(headValue)
        }
    }
}
