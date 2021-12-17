//
//  4949_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/10.
//

import Foundation

enum Parenthesis: String {
    case smallLeft = "("
    case smallRight = ")"
    case bigLeft = "["
    case bigRight = "]"
    
    var mate: Self? {
        switch self {
        case .smallLeft:
            return .smallRight
        case .bigLeft:
            return .bigRight
        default:
            return nil
        }
    }
}

struct Stack {
    var store: [String] = []
    
    mutating func push(this: String) {
        guard let parenthesis = Parenthesis.init(rawValue: this) else {
            return
        }
        
        guard let top = self.top() else {
            self.store.append(parenthesis.rawValue)
            return
        }
       
        if checkMatching(with: top, and: this) {
            let last = self.store.popLast()
        } else {
            self.store.append(parenthesis.rawValue)
        }
    }
    
    func top() -> String? {
        if let last =  self.store.last {
            return last
        } else {
            return nil
        }
    }
    
    func checkMatching(with top: String,
                       and new: String) -> Bool {
        guard let parenthesisFirst = Parenthesis.init(rawValue: top),
              let parenthesisSecond = Parenthesis.init(rawValue: new)
        else {
            return false
        }
        
        if parenthesisFirst.mate == parenthesisSecond {
            return true
        } else {
            return false
        }
    }
}

struct Manager {
    enum Answer: String {
        case yes
        case no
    }
    
    var stack = Stack()
    var sentences: [String] = []
    var result: [Answer.RawValue] = []
    
    mutating func splitSentences(input: String) {
        sentences = [input]
    }
    
    mutating func check() {
        sentences.compactMap { line in
            line.components(separatedBy: " ").compactMap { word in
                var index = 0
                
                for _ in word {
                    index += 1
                }
                
                for i in 0...index - 1 {
                    let cha = word.getChar(at: i)
                    stack.push(this: String(cha))
                }
               
            }
        }
        if stack.store.isEmpty {
            result.append(Answer.yes.rawValue)
        } else {
            result.append(Answer.no.rawValue)
        }
    }
    
    func showResult() {
        result.compactMap {
            print($0)
        }
    }
}

extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

var manager = Manager()

func check() {
    let input = readLine()!
    
    if input != "." {
        manager.splitSentences(input: input)
        manager.check()
        check()
        return
    }
    manager.showResult()
}

check()
