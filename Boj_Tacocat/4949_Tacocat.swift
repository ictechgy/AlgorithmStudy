//
//  4949_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

/*
이 문제는 스택을 활용하는 문제

방법
1. 괄호들을 추출한다
2. 괄호를 저장한 배열과 추가하는 배열을 비교한다.
3. 일치하는 경우 스택에 쌓지 않고 마지막 원소는 삭제한다.
*/

var flag = true
var result = ""

enum Bracket: Character {
    case roundOpen = "("
    case roundClose = ")"
    case rectOpen = "["
    case rectClose = "]"
    
    var mate: Self {
        switch self {
        case .roundOpen:
            return .roundClose
        case .roundClose:
            return .rectOpen
        case .rectOpen:
            return .rectClose
        case .rectClose:
            return .rectOpen
        }
    }
}

class Stack {
    var storage: [Character] = []
    
    func pop() -> Character? {
        return storage.popLast()
    }
    
    func push(element: Character) {
        storage.append(element)
    }
}

while let input = readLine(), input != "." {
    let stack = Stack()
    var isSymetric = false

    for character in input {
        if character == Bracket.rectOpen.rawValue {
            stack.push(element: character)
        } else if character == Bracket.roundOpen.rawValue {
            stack.push(element: character)
        } else if character == Bracket.rectClose.rawValue &&
                    stack.storage.last == Bracket.rectOpen.rawValue {
           let _ = stack.pop()
        } else if character == Bracket.roundClose.rawValue &&
                    stack.storage.last == Bracket.roundOpen.rawValue {
            let _ = stack.pop()
        } else if character == Bracket.roundClose.rawValue || character == Bracket.rectClose.rawValue {
            isSymetric = true
            break
        }
    }
    
    if stack.storage.count == .zero, isSymetric == false {
        result += "yes\n"
    } else {
        result += "no\n"
    }
}

print(result.trimmingCharacters(in: .whitespacesAndNewlines))
