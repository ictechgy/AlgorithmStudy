//
//  Factorial_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/16.
//

func factorial(_ number: UInt) -> UInt {
    if number <= 1 {
        return 1
    } else {
        return number * factorial(number-1)
    }
}
