//
//  Factorial_Soll.swift
//  Factorial
//
//  Created by Dasoll Park on 2021/12/17.
//

func factorial(_ n: Int) -> Int {
    if n <= 0 {
        return 1
    } else {
        return n * factorial(n-1)
    }
}
