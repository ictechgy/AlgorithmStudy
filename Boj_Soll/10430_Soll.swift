//
//  10430_Soll.swift
//  Boj_Soll
//
//  Created by Dasoll Park on 2021/12/08.
//

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let a = input[0]
let b = input[1]
let c = input[2]

print((a+b)%c)
print(((a%c)+(b%c))%c)
print((a*b)%c)
print(((a%c)*(b%c))%c)
