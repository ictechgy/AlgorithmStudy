//
//  Factorial_Ellen.swift
//  BasicConcepts_Ellen
//
//  Created by Ellen on 2021/12/17.
//

import Foundation

func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } else {
        return number * factorial(number - 1)
    }
}
