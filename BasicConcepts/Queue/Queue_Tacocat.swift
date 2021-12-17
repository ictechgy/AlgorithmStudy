//
//  Queue_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

class Queue<Element> {
    private var storage : [Element]?
    
    func enqueue(value: Element) {
        storage?.append(Element)
    }
    
    func dequeue() -> Element? {
        storage?.dropFirst()
    }
    
    func empty() {
        storage =  nil
    }
    
    func front() -> Element? {
        storage?.first
    }
    
    func back() -> Element? {
        storage?.last
    }
    
    func size() -> Int? {
        storage?.count
    }
}

