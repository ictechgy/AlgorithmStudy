//
//  Factorial_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/16.
//

import Foundation

func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } else {
        return number * factorial(number - 1)
    }
}
