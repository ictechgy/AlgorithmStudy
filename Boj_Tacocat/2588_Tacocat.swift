//
//  2588_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/08.
//

import Foundation

let firstInput = readLine()!
let secondInput = readLine()!

secondInput.description.compactMap { Int(String($0)) }.reversed().map { number in
    print(Int(firstInput)! * number)
}
print(Int(firstInput)! * Int(secondInput)!)
