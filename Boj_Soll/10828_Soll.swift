//
//  10828_Soll.swift
//  Boj_Soll
//
//  Created by Dasoll Park on 2021/12/09.
//

class Stack {
    var stack: [Int] = []
    
    func push(x: Int) {
        stack.append(x)
    }
    
    func pop() -> Int {
        if let n = stack.popLast() {
            return n
        }
        return -1
    }
    
    func size() -> Int {
        stack.count
    }
    
    func empty() -> Int {
        if stack.isEmpty {
            return 1
        }
        return 0
    }
    
    func top() -> Int {
        if let n = stack.last {
            return n
        }
        return -1
    }
}

let n = Int(readLine()!)!
let stack = Stack()

(0..<n).forEach { _ in
    let command = readLine()!.split(separator: " ")
    
    switch command[0] {
    case "push":
        stack.push(x: Int(command[1])!)
    case "pop":
        print(stack.pop())
    case "size":
        print(stack.size())
    case "empty":
        print(stack.empty())
    case "top":
        print(stack.top())
    default:
        print("error")
        return
    }
}
