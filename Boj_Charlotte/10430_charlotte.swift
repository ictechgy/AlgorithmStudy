//
//  10430_charlotte.swift
//  Boj_Charlotte
//
//  Created by 이예원 on 2021/12/09.
//

import Foundation

let userInputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = userInputArray[0]
let b = userInputArray[1]
let c = userInputArray[2]

print((a+b)%c)
print(((a%c) + (b%c))%c)
print((a*b)%c)
print(((a%c) * (b%c))%c)
