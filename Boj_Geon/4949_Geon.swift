//
//  4949_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/17.
//

import Foundation

struct Stack<Element> {
    private var container: [Element] = []
    
    func isEmpty() -> Bool {
        container.isEmpty ? true : false
    }
    
    mutating func push(value: Element) {
        container.append(value)
    }
    
    mutating func pop() -> Element {
        return container.removeLast()
    }
    
    func top() -> Element? {
        return container.last
    }
    
}

while true {
    let input = readLine()!
    var flag = true
    var stack = Stack<Character>()

    if input == "." {
        break
    } else {
        for char in input {
            if char == "[" || char == "(" {
                stack.push(value: char)
            } else if char == "]" || char == ")" {
                if stack.isEmpty() {
                    flag = false
                    break
                }
                if char == "]" && stack.pop() != "[" {
                    flag = false
                    break
                }
                else if char == ")" && stack.pop() != "(" {
                    flag = false
                    break
                }
            }
        }
    }
    if flag == false {
        print("no")
    } else {
        if stack.isEmpty() == false {
            print("no")
        } else {
            print("yes")
        }
    }
}

