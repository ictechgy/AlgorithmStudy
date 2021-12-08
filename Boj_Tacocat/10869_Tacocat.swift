//
//  10869_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

// 9달 전 코드
//let line = readLine()!
//let lineArr = line.components(separatedBy: " ")
//let a = Int(lineArr[0])!
//let b = Int(lineArr[1])!
//print(a+b)
//print(a-b)
//print(a*b)
//print(a/b)
//print(a%b)

let input = readLine()
let result = input!.split(separator: " ") .compactMap { Int($0) }

func printResult() {
    print(result[0] + result[1])
    print(result[0] - result[1])
    print(result[0] * result[1])
    print(result[0] / result[1])
}

