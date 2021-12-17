//
//  Queue_Soll.swift
//  BasicConcepts
//
//  Created by Dasoll Park on 2021/12/16.
//

final class Queue<Element> {
    private var storage: [Element] = []
    
    var head: Element? {
        storage.first
    }
    var isEmpty: Bool {
        storage.isEmpty
    }
    var size: Int {
        storage.count
    }
    
    func enqueue(_ item: Element) {
        storage.append(item)
    }
    
    func dequeue() -> Element? {
        if storage.isEmpty { return nil }
        let element = storage.first
        storage = Array(storage.dropFirst())
        return element
    }
}
