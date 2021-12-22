//
//  Stack_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/14.
//

import Foundation

struct Stack {
    private var list: [Any] = []

    mutating func push(value: Any) {
        list.append(value)
    }

    mutating func pop() -> Any {
        if list.isEmpty {
            return false
        } else {
            return list.removeLast()
        }
    }

    func empty() -> Any {
        if list.isEmpty {
            return true
        } else {
            return false
        }
    }

    func top() -> Any? {
        if list.isEmpty {
            return false
        } else {
            return list.last
        }
    }
}
