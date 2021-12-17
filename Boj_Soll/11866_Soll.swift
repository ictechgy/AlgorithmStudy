//
//  11866_Soll.swift
//  AlgorithmStudy
//
//  Created by Dasoll Park on 2021/12/17.
//

import Foundation

let input = readLine()!.split(separator: " ")
let n = input[0]
let k = input[1]
var queue = ArraySlice<Int>(1...n)
var result = ""

while queue.isEmpty == false {
    for i in 0..<k {
        if i + 1 == k {
            let value = String(queue.first!)
            queue = queue.dropFirst()
            result.append(a + ", ")
        } else {
            let value = queue.first!
            queue = queue.dropFirst()
            queue.append(value)
        }
    }
}

result.removeLast()
result.removeLast()
print("<" + result + ">")
