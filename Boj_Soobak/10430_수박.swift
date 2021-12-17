//
//  10430_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let input = readLine() {
    let numbers = input
        .split(separator: " ")
        .compactMap { Int($0) }

    let A = numbers[0], B = numbers[1], C = numbers[2]

    print( (A + B) % C )
    print( ((A % C) + (B % C)) % C )
    print( (A * B) % C )
    print( ((A % C) * (B % C)) % C )
}
