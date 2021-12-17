//
//  Queue_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/09.
//

struct Queue<AnyType> {
    private var linkedList = LinkedList()

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
    }

    mutating func delete() -> AnyType? {
        return linkedList.removeFirst()
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

        mutating func removeFirst() -> AnyType? {
            defer {
                head = head?.next
            }

            return head?.value
        }

        init() { }

        init(headValue: AnyType) {
            self.append(headValue)
        }
    }
}
