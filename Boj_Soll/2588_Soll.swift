//
//  2588_Soll.swift
//  Boj_Soll
//
//  Created by Dasoll Park on 2021/12/09.
//

let a = Int(readLine()!)!
let b = Int(readLine()!)!

print(a*(b%10))
print(a*(b%100/10))
print(a*(b%1000/100))
print(a*b)
