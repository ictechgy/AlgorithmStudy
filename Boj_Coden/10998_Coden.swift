//
//  10998_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

let userInputs = readLine()!
let numbers = userInputs.split(separator: " ").map { Int($0)! }
let multiplication = numbers.reduce(1, *)
print(multiplication)
