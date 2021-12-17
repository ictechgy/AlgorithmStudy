//
//  11866_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/17.
//

import Foundation

func receiveInput() -> [Int] {
    return readLine()!.split(separator: " ").compactMap{Int($0)}
}

let input = receiveInput()
let n = input[0]
let k = input[1]
var list: [Int] = Array(1...n)
var result: [Int] = []
var index = k - 1

while true {
    result.append(list.remove(at: index))
    if list.isEmpty {
        break
    }
    index = (index + k - 1 ) % list.count
    print(index)
}

print("<" + result.map({String($0)}).joined(separator: ", ") + ">")
