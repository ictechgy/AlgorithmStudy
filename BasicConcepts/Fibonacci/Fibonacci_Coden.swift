//
//  Fibonacci_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/17.
//

//피보나치는 1, 1, 2, 3, 5, 8 .. 순서로 나아가는 수열이다.
//i번째 값은 i-1 과 i-2 값의 합으로 나타난다.
//첫번째값과 두번째 값은 1이며 구하고자 하는 값을 n번째라고 가정하자. (n > 0)

//MARK: - Recursion
func fibonacci(n: Int) -> Int {
    if n <= 2 {
        return 1
    }
    return fibonacci(n: n-1) + fibonacci(n: n-2)
}

//MARK: - Memoization(Top-Down)
let input = 100 //사용자가 원하는 n번째 값 입력
var fibMemo = [Int]()
for _ in 0...input {
    fibMemo.append(0)
}
func MemoizationFib(n: Int) -> Int {
    if n <= 2 {
        return 1
    } else if fibMemo[n] != 0 {
        return fibMemo[n]
    } else {
        fibMemo[n] = MemoizationFib(n: n-1) + MemoizationFib(n: n-2)
        return fibMemo[n]
    }
}

//MARK: - DP(Bottom-Up)
let input2 = 100 //사용자가 원하는 n번째 값 입력
var fibMemoization = [Int]()
for _ in 0...input2 {
    fibMemoization.append(0)
}
fibMemoization[1] = 1
fibMemoization[2] = 1
func DPFib(n: Int) -> Int {
    for index in 3...n {
        fibMemoization[index] = fibMemoization[index-1] + fibMemoization[index-2]
    }
    return fibMemoization[n]
}
