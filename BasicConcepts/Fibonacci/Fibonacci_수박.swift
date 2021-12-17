//
//  Fibonacci_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/16.
//

func fibonacci(_ number: UInt) -> UInt {
    if number <= 1 {
        return 1
    } else {
        return fibonacci(number-2) + fibonacci(number-1)
    }
}
