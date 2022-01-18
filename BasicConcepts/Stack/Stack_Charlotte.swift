//
//  Stack.swift
//  BasicConcepts
//
//  Created by 이예원 on 2021/12/11.
//

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public var peek: T? {
        return stack.last
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}
