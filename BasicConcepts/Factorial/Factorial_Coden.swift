//
//  Factorial_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/17.
//

//팩토리얼은 특정 숫자값 n에 대해 n부터 1까지의 곱을 의미한다.
//0!은 1로 약속되어있다. 따라서 n >= 0

//MARK: - Recursion
func factorial(n: Int) -> Int {
    if n <= 0 {
        return 1
    }
    return n * factorial(n: n-1)
}

//MARK: - Iterative
func IterativeFact(n: Int) -> Int {
    return (1...n).reduce(1, *)
}

