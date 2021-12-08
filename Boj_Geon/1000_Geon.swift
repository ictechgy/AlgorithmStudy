//
//  1000_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/08.
//

import Foundation

func receiveInput() -> [Int] {
    return readLine()!.split(separator: " ").compactMap{Int($0)}
}

func combine() {
    let input = receiveInput()
    let first = input[0]
    let second = input[1]
    print("\(first+second)")
}

combine()
