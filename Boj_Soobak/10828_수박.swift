//
//  10828_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/09.
//

import Foundation

struct Stack<AnyType> {
    private var linkedList = LinkedList()
    var size = 0

    var head: AnyType? {
        linkedList.tail?.value
    }

    var isEmpty: Bool {
        linkedList.head == nil
    }

    mutating func push(_ value: AnyType) {
        linkedList.append(value)
        size += 1
    }

    mutating func pop() -> AnyType? {
        defer {
            if linkedList.removeLast() {
                size -= 1
            }
        }

        return linkedList.tail?.value
    }
}


// MARK: - components
extension Stack {
    private class Node {
        private(set) var value: AnyType
        weak var prev: Node?
        var next: Node?

        init(value: AnyType, next: Node? = nil) {
            self.value = value
        }

        func updateValue(by value: AnyType) {
            self.value = value
        }
    }

    private struct LinkedList {
        private(set) var head: Node?
        private(set) weak var tail: Node?

        var isEmpty: Bool {
            return head == nil
        }

        mutating func append(_ value: AnyType) {
            let newNode = Node(value: value)

            if isEmpty {
                head = newNode
                head?.next = newNode
            } else {
                tail?.next = newNode
                newNode.prev = tail
            }

            tail = newNode
        }

        var target: Node? {
            return head?.next
        }

        mutating func removeLast() -> Bool {
            defer {
                if tail == nil {
                    head = nil
                }
            }
            if tail != nil {
                tail = tail?.prev
                tail?.next = nil
                return true
            } else {
                return false
            }
        }

        init() { }

        init(headValue: AnyType) {
            self.append(headValue)
        }
    }
}

enum InputCases: String {
    case push
    case pop
    case size
    case empty
    case top
}

enum ResultCases: Int {
    case canNotFindHead = -1
    case notEmptied
    case emptied
}

if let input = readLine(),
   let orderSize = Int(input) {

    var stack = Stack<Int>()
    var result = ""

    for _ in 0..<orderSize {
        if let input = readLine() {
            switch input {
            case InputCases.top.rawValue:
                if let value = stack.head {
                    result += value.description + "\n"
                } else {
                    result += ResultCases.canNotFindHead.rawValue.description + "\n"
                }

            case InputCases.pop.rawValue:
                if let value = stack.pop() {
                    result += value.description + "\n"
                } else {
                    result += ResultCases.canNotFindHead.rawValue.description + "\n"
                }

            case InputCases.size.rawValue:
                result += stack.size.description + "\n"

            case InputCases.empty.rawValue:
                if stack.isEmpty {
                    result += ResultCases.emptied.rawValue.description + "\n"
                } else {
                    result += ResultCases.notEmptied.rawValue.description + "\n"
                }

            default:
                if input.contains(InputCases.push.rawValue),
                   let pushedValue = Int(input.split(separator: " ")[1]) {
                    stack.push(pushedValue)
                }
            }
        }
    }

    print(result)
}
