//
//  Fibonacci.swift
//  Execution
//
//  Created by 김준건 on 2021/12/17.
//

import Foundation

func fibonacci(input n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(input: n-1) + fibonacci(input: n-2)
    }
}
