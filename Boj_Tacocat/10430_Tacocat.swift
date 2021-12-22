//
//  10430_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

let line = readLine()!
let lineArr = line.components(separatedBy: " ")
let a = Int(lineArr[0])!
let b = Int(lineArr[1])!
let c = Int(lineArr[2])!
let d = (a % c) + (b % c)
let e = (a % c) * (b % c)
let f = a + b
let g = a * b

print(f % c)
print(d % c)
print(g % c)
print(e % c)
