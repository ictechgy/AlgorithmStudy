//
//  Fibonacci_Charlotte.swift
//  BasicConcepts
//
//  Created by 이예원 on 2022/01/07.
//

import Foundation

func fibonacci(_ number: Int) -> Int {
    if number < 2 {
        return number
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}
