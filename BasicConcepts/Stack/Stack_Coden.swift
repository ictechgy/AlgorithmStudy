//
//  Stack_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

struct Stack<Element> {
    private var storage = [Element]()
    
    var size: Int {
        return storage.count
    }
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var top: Element? {
        return storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}
