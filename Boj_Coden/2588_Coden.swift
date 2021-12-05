//
//  2588_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/06.
//

let firstNumber = Int(readLine()!)!
let secondNumber = Int(readLine()!)!

let units = (secondNumber / 1) % 10
let tens = (secondNumber / 10) % 10
let hundreds = (secondNumber / 100) % 10

print(firstNumber * units)
print(firstNumber * tens)
print(firstNumber * hundreds)
print(firstNumber * secondNumber)
