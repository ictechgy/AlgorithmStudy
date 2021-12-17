//
//  10828_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/10.
//

let userInput = Int(readLine()!)!
let params = ["push", "pop", "size", "empty", "top"]
var stack: [Int] = []

for _ in 1...userInput {
    let userInput = readLine()!
    let splitedInput = userInput.split(separator: " ")
    if params.contains(String(splitedInput[0])) {
        switch splitedInput[0] {
        case "push":
            stack.append(Int(splitedInput[1])!)
        case "pop":
            if stack.isEmpty {
                print("-1")
            } else {
                print(stack.popLast()!)
            }
        case "size":
            print(stack.count)
        case "empty":
            if stack.isEmpty {
                print("1")
            } else {
                print("0")
            }
        case "top":
            if stack.isEmpty {
                print("-1")
            } else {
                print(stack.last!)

            }
        default: break
        }
    }
}
