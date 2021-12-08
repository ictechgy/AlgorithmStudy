//
//  LinkedList_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/08.
//

import Foundation

class Node<AnyType> {
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

struct LinkedList<AnyType: CustomStringConvertible> {
    private(set) var head: Node<AnyType>?
    private(set) weak var tail: Node<AnyType>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func append(_ value: AnyType) {
        let newNode = Node(value: value)

        if isEmpty {
            head = newNode
            head?.next = newNode
        } else {
            tail?.next = newNode
            newNode.prev = tail
        }

        tail = newNode
    }

    var target: Node<AnyType>? {
        return head?.next
    }

    mutating func remove(target: Node<AnyType>?) {
        var targetToDelete = head

        while target !== targetToDelete {
            targetToDelete = targetToDelete?.next
        }

        if let previousNode = targetToDelete?.prev {
            previousNode.next = targetToDelete?.next
            previousNode.next?.prev = previousNode
        } else {
            head = targetToDelete?.next
        }
    }

    mutating func removeLast() {
        tail = tail?.prev
        tail?.next = nil
    }

    init() { }

    init(headValue: AnyType) {
        self.append(headValue)
    }
}
