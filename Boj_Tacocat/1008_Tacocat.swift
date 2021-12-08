//
//  1008_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

//let line = readLine()!
//let lineArr = line.components(separatedBy: " ")
//let a = Double(lineArr[0])!
//let b = Double(lineArr[1])!
//print(a/b)

let input = readLine()
let result = input!.split(separator: " ") .compactMap { Int($0) }
print(result[0] / result[1])
