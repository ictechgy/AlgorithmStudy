//
//  10430_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

let userInputs = readLine()!
let numbers = userInputs.split(separator: " ").map { Int($0)! }
let firstNumber = numbers[0]
let secondNumber = numbers[1]
let thirdNumber = numbers[2]

print((firstNumber + secondNumber) % thirdNumber)
print(((firstNumber % thirdNumber) + (secondNumber % thirdNumber)) % thirdNumber)
print((firstNumber * secondNumber) % thirdNumber)
print(((firstNumber % thirdNumber) * (secondNumber % thirdNumber)) % thirdNumber)
