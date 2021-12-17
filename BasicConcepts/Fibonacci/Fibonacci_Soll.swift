//
//  Fibonacci_Soll.swift
//  Fibonacci
//
//  Created by Dasoll Park on 2021/12/17.
//

func fibonacci(_ n: Int) -> Int {
    if n < 2 {
        return n
    } else {
        return fibonacci(n-1) + fibonacci(n-2)
    }
}
