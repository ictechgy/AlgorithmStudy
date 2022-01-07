//
//  1158_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/17.
//

let userInput = readLine()!.split(separator: " ")

let n: Int = Int(userInput[0])!
let k: Int = Int(userInput[1])!

var index: Int = 0
var queue: [Int] = []
var answer: [Int] = []

for i in 1...n {
    queue.append(i)
}

while !queue.isEmpty {
    index += (k-1)
    if index > queue.count - 1 {
        index %= queue.count
    }
    answer.append(queue.remove(at: index))
}

print("<", terminator: "")
for i in 0...answer.count - 2 {
    print(answer[i], terminator: ", ")
}
print("\(answer.last!)>")
