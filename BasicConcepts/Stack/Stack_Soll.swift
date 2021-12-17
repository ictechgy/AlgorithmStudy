//
//  Stack_Soll.swift
//  BasicConcepts
//
//  Created by Dasoll Park on 2021/12/16.
//

class Stack<T> {
    var stack: [T] = []
    var top: T? {
        stack.last
    }
    var isEmpty: Bool {
        stack.isEmpty
    }
    var size: Int {
        stack.count
    }
    
    func push(item: T) {
        stack.append(item)
    }
    
    func pop() -> T? {
        stack.popLast()
    }
}
