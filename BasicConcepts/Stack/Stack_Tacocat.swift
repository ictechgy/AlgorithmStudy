//
//  Stack.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

struct Stack<Value> {
    var store: [Value] = []

    mutating func push(this value: Value) {
        self.store.append(value)
    }

    mutating func pop() -> Value? {
       return self.store.popLast()
    }

    func isEmpty() -> Bool {
        if store.isEmpty {
            return true
        } else {
            return false
        }
    }

    func peek() -> Value? {
        if let last =  self.store.last {
            return last
        } else {
           return nil
        }
    }
}
