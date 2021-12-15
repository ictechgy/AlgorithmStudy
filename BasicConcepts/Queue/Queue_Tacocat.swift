//
//  Queue_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

class Queue<Value> {
    var storage : [Value]?
    
    func enqueue(value: Value) {
        storage?.append(value)
    }
    
    func dequeue() -> Value? {
        storage?.removeFirst()
    }
    
    func empty() {
        storage =  nil
    }
    
    func front() -> Value? {
        storage?.first
    }
    
    func back() -> Value? {
        storage?.last
    }
    
    func size() -> Int? {
        storage?.count
    }
}

