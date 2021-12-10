//
//  10828_tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

struct Stack {
    static var store: [Int] = []
    private static let somethingInStore = 1
    private static let emptyStore = 0
    private static let invalidRequest = -1
    static var result: [Int] = []
    
    static func push(this number: Int) {
        self.store.append(number)
    }
    
    static func pop() {
        if let last =  self.store.popLast() {
            result.append(last)
        } else {
            result.append(invalidRequest)
        }
    }
    
    static func size() {
        result.append(self.store.count)
    }
    
    static func empty() {
        if self.store.count == .zero {
            result.append(somethingInStore)
        } else {
            result.append(emptyStore)
        }
    }
    
    static func top() {
        if let last =  self.store.last {
            result.append(last)
        } else {
            result.append(invalidRequest)
        }
    }
}

func check(command: String) {
    let commandDetail = command.components(separatedBy: " ")
    
    guard let first = commandDetail.first else {
        return
    }
    
    switch first {
    case "push":
        if let second = commandDetail.last,
           let secondNumber = Int(second) {
            Stack.push(this: secondNumber)
        }
    case "top":
        Stack.top()
    case "size":
        Stack.size()
    case "empty":
        Stack.empty()
    case "pop":
        Stack.pop()
    default:
        print("Error")
    }
}

func start() {
    let firstInput = readLine()!
    var loopNumber = Int(firstInput)!
    
    while loopNumber != .zero {
        let input = readLine()!
        check(command: input)
        loopNumber -= 1
    }
    
    Stack.result.map { number in
        print(number)
    }
}

start()
