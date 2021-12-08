//
//  10430_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/09.
//

import Foundation

func receiveInput() -> [Int] {
    return readLine()!.split(separator: " ").compactMap{Int($0)}
}

func calculateRest() {
    let input = receiveInput()
    let first = input[0]
    let second = input[1]
    let third = input[2]
    print("\((first + second) % third)")
    print("\(((first % third) + (second % third)) % third)")
    print("\((first * second) % third)")
    print("\(((first % third) * (second % third)) % third)")
}


calculateRest()
