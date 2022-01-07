//
//  18258_ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/17.
//

let userInput = Int(readLine()!)!
let params = ["push", "pop", "size", "empty", "front", "back"]
var queue: [Int] = []

for _ in 1...userInput {
    let splitedInput = readLine()!.split(separator:" ").map { String($0) }
    if params.contains(splitedInput[0]) {
        switch splitedInput[0] {
        case "push":
            queue.append(Int(splitedInput[1])!)
        case "pop":
            if queue.isEmpty {
                print("-1")
            } else {
                print(queue.popLast()!)
            }
        case "size":
            print(queue.count)
        case "empty":
            if queue.isEmpty {
                print("1")
            } else {
                print("0")
            }
        case "front":
            if queue.isEmpty {
                print("-1")
            } else {
                print(queue.first!)
            }
        case "back":
            if queue.isEmpty {
                print("-1")
            } else {
                print(queue.last!)
            }
        default: break
        }
    }
}
