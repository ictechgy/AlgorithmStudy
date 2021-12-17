//
//  10828_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/14.
//

import Foundation

struct Stack{
    private var list: [Int] = []

    mutating func push(input: Int) {
        list.append(input)
    }

    mutating func pop() -> Int{
        if list.isEmpty {
            return -1
        } else {
            return list.removeLast()
        }
    }

    func size() -> Int {
        return list.count
    }

    func empty() -> Int {
        if list.count == .zero {
            return 1
        } else {
            return .zero
        }
    }

    func top() -> Int {
        if list.isEmpty {
            return -1
        } else {
            return list[list.count - 1]
        }
    }
}




var stack = Stack()

for _ in 0 ..< Int(readLine()!)! {
    let command = readLine()!.split(separator: " ")

    switch command[0] {
    case "push":
        stack.push(input: Int(command[1])!)
    case "pop":
        print(stack.pop())
    case "size":
        print(stack.size())
    case "empty":
        print(stack.empty())
    case "top":
        print(stack.top())
    default:
        break
    }
}
