//
//  LinkedList.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

struct LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
}

extension LinkedList {
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func append(_ value: Value) {
        if isEmpty() {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func remove() -> Value? {
        defer { head = head?.next }
        return head?.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    func glance() -> Value? {
        return head?.value
    }
}

class Node<Value> {
    var value: Value
    var next: Node? = nil
    
    init(value: Value) {
        self.value = value
    }
    
    init(value: Value, next: Node?) {
        self.value = value
        self.next = next
    }
}
