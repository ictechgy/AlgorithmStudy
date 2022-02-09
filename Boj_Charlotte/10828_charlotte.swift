//
//  10828_charlotte.swift
//  Boj_Charlotte
//
//  Created by 이예원 on 2022/02/09.
//
import Foundation

    var stack: [Int] = []

    let N = Int(readLine()!)

    for _ in 0..<N! {
        let input = readLine()!.components(separatedBy:" ").map{ String($0) }
        switch input[0] {
        case "push":
            push(Int(input[1])!)
            break
        case "pop":
            print(pop()!)
            break
        case "size":
            print(size())
            break
        case "empty":
            print(empty())
            break
        case "top":
            print(top()!)
            break
        default:
            break
        }
    

    func empty() -> Int{
        if stack.isEmpty {
            return 1
        } else {
            return 0
        }
    }
    
    func size() -> Int{
        return stack.count
    }
    
    func top() -> Int? {
        if stack.isEmpty {
            return -1
        } else {
            return stack.last
        }
    }
    
    func push(_ element: Int) {
        stack.append(element)
    }
    
    func pop() -> Int? {
        if stack.isEmpty {
            return -1
        } else {
            return stack.popLast()
        }
    }
}



