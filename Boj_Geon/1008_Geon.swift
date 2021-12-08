//
//  1008_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/08.
//

import Foundation

func receiveInput() -> [Double] {
    return readLine()!.split(separator: " ").compactMap{Double($0)}
}

func divide() {
    let input = receiveInput()
    let first = input[0]
    let second = input[1]
    print(first/second)
}

divide()
