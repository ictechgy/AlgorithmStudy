//
//  LinkedList.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

struct LinkedList<T> {
    class Node<T> {
        var data: T
        var next: Node?
        
        init(value: T) {
            self.data = value
        }
    }
    
    var head: Node<T>?
    
    var size: Int {
        var count = Int.zero
        var start = head
        
        while start?.next != nil {
            count += 1
            start = start?.next
        }
        return count
    }
    
    var isEmpty: Bool {
        head? == nil
    }
    
    init(value: T) {
        self.head = Node<T>(value: value)
    }
    
    mutating func insert(value: T) {
        if head == nil {
            head = Node<T>(value: value)
        } else {
            head?.next = Node<T>(value: value)
        }
    }
    
    mutating func delete() -> T? {
        defer {
            head = head?.next
        }
        return head?.data
    }
    
    func front() -> T? {
        head?.data
    }
}
