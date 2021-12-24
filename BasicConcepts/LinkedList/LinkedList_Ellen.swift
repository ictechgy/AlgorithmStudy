//
//  LinkedList_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/17.
//

import Foundation

final class Node<T> {
    var value: T
    var next: Node?
    var previous: Node?

    init(value: T, previous: Node?, next: Node?) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
    weak var tail: Node<T>?

    var empty: Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }

    func add(_ value: T) {
        if head == nil {
            head = Node(value: value, previous: nil, next: nil)
            tail = head
        } else {
            tail?.next = Node(value: value, previous: tail, next: nil)
        }
    }

    func addFirst(_ value: T) {
    }
}
