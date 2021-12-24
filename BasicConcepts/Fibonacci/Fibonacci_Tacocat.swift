//
//  Fibonacci_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/16.
//

import Foundation

func fibonacci(_ number: Int) -> Int {
    if number == 0 {
        return 0
    } else if number == 1 {
        return 1 + fibonacci(number - 1)
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}
