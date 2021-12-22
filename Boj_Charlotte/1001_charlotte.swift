//
//  1001_charlotte.swift
//  Boj_Charlotte
//
//  Created by 이예원 on 2021/12/09.
//

import Foundation

let userInputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = userInputArray[0]
let b = userInputArray[1]

print(a - b)
