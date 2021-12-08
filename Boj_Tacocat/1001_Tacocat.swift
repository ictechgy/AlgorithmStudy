//
//  1001_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

let input = readLine()
let result = input!.split(separator: " ") .compactMap { Int($0) }
print(result[0] - result[1])
