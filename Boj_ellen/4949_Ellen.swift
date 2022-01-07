//
//  4949_Ellen.swift
//  Boj_Ellen
//
//  Created by Ellen on 2021/12/17.
//

while true {
    let userInput = readLine()!
    var check = true
    if userInput == "." {
        break
    }
    var stack: [String.Element] = []

    for char in userInput {
        if "([".contains(char) {
            stack.append(char)
        } else if char == ")" {
            if !stack.isEmpty && stack.last! == "(" {
                stack.popLast()
            } else {
                check = false
                break
            }
        } else if char == "]" {
            if !stack.isEmpty && stack.last! == "[" {
                stack.popLast()
            } else {
                check = false
                break
            }
        }
    }
    
    if stack.isEmpty && check {
        print("yes")
    } else {
        print("no")
    }
}
