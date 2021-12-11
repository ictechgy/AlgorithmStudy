//
//  Stack_Ellen.swift
//  BasicConcepts
//
//  Created by Ellen on 2021/12/10.
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

class Stack<T> {
    var top: Node<T>?
    
    var empty: Bool {
        if top == nil {
            return true
        } else {
            return false
        }
    }
    
    func push(_ value: T) {
        if top == nil {
            top = Node(value: value, previous: nil, next: nil)
        } else {
            top?.next = Node(value: value, previous: top, next: nil)
            top = top?.next
        }
    }
    
    func pop() {
        print(top?.value as Any)
        top = top?.previous
    }
}
