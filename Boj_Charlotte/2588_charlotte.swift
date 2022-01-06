//
//  2588_charlotte.swift
//  Boj_Charlotte
//
//  Created by 이예원 on 2022/01/07.
//

import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!

print(a*(b%10))
print(a*((b%100)/10))
print(a*(b/100))
print(a*b)
