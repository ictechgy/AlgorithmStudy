//
//  Factorial_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/17.
//

import Foundation

func factorial(input n: Int) -> Int {
    if n == .zero {
        return 1
    } else {
        return n * factorial(input: n-1)
    }
}
