//
//  10430_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/09.
//

let userInput = readLine()!
let numbers = userInput.split(separator: " ")
let a = Int(numbers[0])!, b = Int(numbers[1])!, c = Int(numbers[2])!

print((a + b) % c)
print(((a % c) + (b % c)) % c)
print((a * b) % c)
print((a % c) * (b % c) % c)
