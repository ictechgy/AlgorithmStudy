//
//  4949_Soll.swift
//  Boj_Soll
//
//  Created by Dasoll Park on 2021/12/10.
//

import Foundation

class Stack {
    var stack: [Character] = []
    
    func push(x: Character) {
        stack.append(x)
    }
    
    func pop() -> Character? {
        if let n = stack.popLast() {
            return n
        }
        return nil
    }
    
    func size() -> Int {
        stack.count
    }
    
    func empty() -> Bool {
        if stack.isEmpty {
            return true
        }
        return false
    }
    
    func top() -> Character? {
        if let n = stack.last {
            return n
        }
        return nil
    }
}


for _ in 0..<100 {
    var input = readLine()!
    
    if input == "." {
        exit(0)
    }
    
    let bracketStack = Stack()
    var isValid = false
    
    input.removeLast()
    let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if trimmedInput.isEmpty {
        print("yes")
        continue
    }
    
    for char in trimmedInput {
        if char == "(" || char == "[" {
            bracketStack.push(x: char)
        }
        
        if char == ")" && bracketStack.pop() == "(" {
            isValid = true
        }
        
        if char == "]" && bracketStack.pop() == "[" {
            isValid = true
        }
    }
    
    print(isValid ? "yes" : "no")
}
