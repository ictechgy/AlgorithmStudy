//
//  2588_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/09.
//

let firstUserInput = readLine()!
let secondUserInput = readLine()!
var array: [Int] = []
var result: Int = 0

for i in secondUserInput.reversed() {
    let number = Int(firstUserInput)! * i.wholeNumberValue!
    array.append(number)
    print(number)
}

array[1] *= 10
array[2] *= 100

array.forEach { i in
    result += i
}

print(result)
