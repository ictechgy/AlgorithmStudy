//
//  LinkedList_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/14.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node?) {
        self.data = data
        self.next = next
    }
        
}

final class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(data: T) {
        let newNode = Node(data: data, next: nil)
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> Node<T>? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func peekFirst() -> Node<T>? {
        return head
    }
    
}
