//
//  10998_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let input = readLine() {
    let result = input
        .split(separator: " ")
        .compactMap { Int($0) }
        .reduce(1) { $0 * $1 }

    print(result)
}
