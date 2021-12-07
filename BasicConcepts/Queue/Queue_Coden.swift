//
//  Queue_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

struct Queue<Element> {
    private var storage = [Element]()
    
    var size: Int {
        return storage.count
    }
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var front: Element? {
        return storage.first
    }
    var back: Element? {
        return storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    mutating func pop() -> Element? {
        if isEmpty {
            return nil
        }
        return storage.removeFirst()
    }
}
