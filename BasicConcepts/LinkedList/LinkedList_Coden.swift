//
//  LinkedList_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

struct LinkedList<T: Equatable> {
    //캡슐화를 위해 Node를 내부에 선언
    private class Node<T> {
        let data: T
        var next: Node<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var head: Node<T>?
    private let firstIndex = 0
    
    //O(n)
    var size: Int {
        var count = Int.zero
        var node = head
        while node != nil {  //while let 바인딩도 써볼 수 있을 것 같다.
            count += 1
            node = node?.next
        }
        return count
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func insertIntoFront(with data: T) {
        let node = Node(data: data)
        node.next = head?.next
        head = node
    }
    //O(n)
    mutating func insert(into index: Int, with data: T) -> T? {
        if index < firstIndex || index > size { //Invalid Index
            return nil
        }
        if index == firstIndex {
            insertIntoFront(with: data)
            return data
        }
        
        var remainingDistance = index
        var previousNode: Node<T>? = nil
        var nextNode = head
        while remainingDistance != .zero {
            previousNode = nextNode
            nextNode = nextNode?.next
            remainingDistance -= 1
        }
        let newNode = Node(data: data)
        newNode.next = nextNode
        previousNode?.next = newNode
        
        return data
    }
    mutating func insertIntoRear(with data: T) {
        _ = insert(into: size, with: data)
    }
    //최악의 경우 O(n)
    func search(for data: T) -> Int? {
        var presentNode = head
        var index = firstIndex
        while presentNode != nil {
            if presentNode?.data == data {
                return index
            }
            presentNode = presentNode?.next
            index += 1
        }
        return nil
    }
    mutating func deleteFront() -> T? {
        let data = head?.data
        head = head?.next
        return data
    }
    mutating func delete(at index: Int) -> T? {
        if index < firstIndex || index >= size { //Invalid Index
            return nil
        }
        if index == firstIndex {
            return deleteFront()
        }
        var previousNode: Node<T>? = nil
        var targetNode = head
        var countToDestination = firstIndex
        while countToDestination != index {
            previousNode = targetNode
            targetNode = targetNode?.next
            countToDestination += 1
        }
        let data = targetNode?.data
        previousNode?.next = targetNode?.next
        
        return data
    }
    mutating func delete(about data: T) -> T? {
        guard let index = search(for: data) else {
            return nil
        }
        let data = delete(at: index)
        return data
    }
    mutating func deleteRear() -> T? {
        let lastIndex = size - 1
        return delete(at: lastIndex)
    }
}
