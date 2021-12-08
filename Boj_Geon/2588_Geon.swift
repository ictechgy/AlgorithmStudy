//
//  2588_Geon.swift
//  Execution
//
//  Created by 김준건 on 2021/12/09.
//

import Foundation

func receiveInput() -> Int {
    return (Int(readLine() ?? "") ?? 0)
}

func multiplication() {
    let firstInput = receiveInput()
    let secondInput = receiveInput()
    print(firstInput * (secondInput % 10))
    print(firstInput * ((secondInput % 100) / 10))
    print(firstInput * (secondInput / 100))
    print(firstInput * secondInput)
}


multiplication()
