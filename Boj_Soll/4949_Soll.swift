//
//  4949_Soll.swift
//  Boj_Soll
//
//  Created by Dasoll Park on 2021/12/10.
//

import Foundation

class Stack {
    var stack: [Character] = []
    var isEmpty: Bool {
        stack.isEmpty
    }
    
    func push(x: Character) {
        stack.append(x)
    }

    func pop() -> Character? {
        if let n = stack.popLast() {
            return n
        }
        return nil
    }
}


while true {
    var input = readLine()!
    
    if input == "." {
        break
    }

    let bracketStack = Stack()
    var isValid = true

    let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)

    for char in trimmedInput {
        if char == "(" || char == "[" {
            bracketStack.push(x: char)
        } else if char == ")" || char == "]" {
            if bracketStack.isEmpty {
                isValid = false
                break
            }
            if char == ")" && bracketStack.pop() != "(" {
                isValid = false
                break
            } else if char == "]" && bracketStack.pop() != "[" {
                isValid = false
                break
            }
        }
    }

    if isValid == false {
        print("no")
    } else {
        if !bracketStack.isEmpty {
            print("no")
        } else {
            print("yes")
        }
    }
}
