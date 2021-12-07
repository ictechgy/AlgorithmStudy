//
//  10869_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let input = readLine() {
    let numbers = input
        .split(separator: " ")
        .compactMap { Int($0) }

    let a = numbers[0], b = numbers[1]

    print(a + b)
    print(a - b)
    print(a * b)
    print(a / b)
    print(a % b)
}
