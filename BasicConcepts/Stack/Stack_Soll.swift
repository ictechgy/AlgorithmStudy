//
//  Stack_Soll.swift
//  BasicConcepts
//
//  Created by Dasoll Park on 2021/12/16.
//

final class Stack<Element> {
    private var stack: [Element] = []
    
    var top: Element? {
        stack.last
    }
    var isEmpty: Bool {
        stack.isEmpty
    }
    var size: Int {
        stack.count
    }
    
    func push(item: Element) {
        stack.append(item)
    }
    
    func pop() -> Element? {
        stack.popLast()
    }
}
