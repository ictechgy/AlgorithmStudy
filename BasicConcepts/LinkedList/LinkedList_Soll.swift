//
//  LinkedList_Soll.swift
//  BasicConcepts
//
//  Created by Dasoll Park on 2021/12/16.
//

final class Node<T: Equatable> {
    let item: T
    var next: Node?
    
    init(item: T, next: Node?) {
        self.item = item
        self.next = next
    }
}

final class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func insert(_ item: T) {
        if head == nil {
            head = Node(item: item, next: nil)
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(item: item, next: nil)
    }
    
    func showItems() {
        var current = head
        while current != nil {
            print(current?.item ?? "", terminator: " ")
            current = current?.next
        }
    }
    
    func obtainLastItem() -> T? {
        if head == nil {
            return nil
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        return current?.item
    }
    
    func delete(item: T) {
        if head?.item == item {
            head = head?.next
        }
        
        var previous: Node<T>?
        var current = head
        
        while current != nil && current?.item != item {
            previous = current
            current = current?.next
        }
        
        previous?.next = current?.next
    }
}
