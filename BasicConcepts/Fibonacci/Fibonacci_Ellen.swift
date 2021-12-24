//
//  Fibonacci_Ellen.swift
//  BasicConcepts_Ellen
//
//  Created by Ellen on 2021/12/17.
//

import Foundation

func fibonacci(_ number: Int) -> Int {
    if number == 0 {
        return 0
    } else if number == 1 {
        return 1
    } else {
        return fibonacci(number-1) + fibonacci(number-2)
    }
}
