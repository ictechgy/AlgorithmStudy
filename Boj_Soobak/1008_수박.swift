//
//  1008_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let input = readLine() {
    let numbers = input
        .split(separator: " ")
        .compactMap { Double($0) }

    print(numbers[0] / numbers[1])
}
