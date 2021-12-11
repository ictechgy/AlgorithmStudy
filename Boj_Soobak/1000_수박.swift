//
//  1000_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let input = readLine() {
    let result = input
        .split(separator: " ")
        .compactMap { Int($0) }
        .reduce(0) { $0 + $1}

    print(result)
}
