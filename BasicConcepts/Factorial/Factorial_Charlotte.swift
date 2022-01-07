//
//  Factorial_Charlotte.swift
//  BasicConcepts
//
//  Created by 이예원 on 2022/01/07.
//

// 0! = 1

import Foundation

func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } else {
        return number * factorial(number - 1)
    }
}
