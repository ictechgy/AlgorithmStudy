//
//  Queue_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/14.
//

import Foundation

struct Queue {
    private var list: [Any] = []

    mutating func enqueue(value: Any) {
        list.append(value)
    }

    mutating func dequeue() -> Any {
        if list.isEmpty {
            return false
        } else {
            return list.removeFirst()
        }
    }

    func empty() -> Any {
        if list.isEmpty {
            return true
        } else {
            return false
        }
    }

    func front() -> Any? {
        if list.isEmpty {
            return false
        } else {
            return list.first
        }
    }
}
