//
//  2558_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/07.
//

import Foundation

if let inputA = readLine(),
   let inputB = readLine(),
   let upperNumber = Int(inputA),
   let lowerNumber = Int(inputB) {
    let eachDigitOfLowerNumber = lowerNumber.description
        .compactMap { Int($0.description) }
        .reversed()

    for digit in eachDigitOfLowerNumber {
        print(upperNumber * digit)
    }

    print(upperNumber * lowerNumber)
}
