//
//  1000_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/05.
//

let userInputs = readLine()!
let numbers = userInputs.split(separator: " ").map { Int($0)! }
let sum = numbers.reduce(0, +)
print(sum)
