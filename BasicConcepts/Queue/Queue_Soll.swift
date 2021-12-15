//
//  Queue_Soll.swift
//  BasicConcepts
//
//  Created by Dasoll Park on 2021/12/16.
//

class Queue<T> {
    var queue: [T] = []
    var top: T? {
        queue.first
    }
    var isEmpty: Bool {
        queue.isEmpty
    }
    var size: Int {
        queue.count
    }
    
    func enqueue(item: T) {
        queue.append(item)
    }
    
    func dequeue() -> T? {
        if queue.isEmpty { return nil }
        return queue.removeFirst()
    }
}
