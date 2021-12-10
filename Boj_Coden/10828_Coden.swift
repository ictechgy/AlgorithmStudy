//
//  10828_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/08.
//

enum Instruction: String {
    case push, pop, size, empty, top
}

enum StackStatusCode {
    static let unableToGetValueFromStack = -1
    static let stackIsEmpty = 1
    static let stackIsNotEmpty = 0
}

struct Stack<Element> {
    private var storage = [Element]()
    
    var size: Int {
        return storage.count
    }
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var top: Element? {
        return storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

let numberOfInstructions = Int(readLine()!)!
var stack = Stack<Int>()

for _ in Int.zero..<numberOfInstructions {
    let userInput = readLine()!.split(separator: " ")
    let instruction = Instruction(rawValue: String(userInput[0]))!
    
    switch instruction {
    case .push:
        let element = Int(userInput[1])!
        stack.push(element)
    case .pop:
        guard let element = stack.pop() else {
            print(StackStatusCode.unableToGetValueFromStack)
            break
        }
        print(element)
    case .size:
        print(stack.size)
    case .empty:
        if stack.isEmpty {
            print(StackStatusCode.stackIsEmpty)
        } else {
            print(StackStatusCode.stackIsNotEmpty)
        }
    case .top:
        guard let element = stack.top else {
            print(StackStatusCode.unableToGetValueFromStack)
            break
        }
        print(element)
    }
}
