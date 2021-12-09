//
//  4949_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/09.
//

//이 문제는 숫자값을 이용한 방식으로도 해결할 수 있다. (다만 중간도 균형이 맞아야 한다는 것은 숫자로 풀기에는 난해)

while let sentence = readLine(), sentence.first != "." {
    var stack = ""
    
    for letter in sentence {
        switch letter {
        case "(", "[":
            stack.append(letter)
        case ")":
            guard let lastLetter = stack.popLast(), lastLetter == "(" else {
                stack.append("fail")
                break
            }
        case "]":
            guard let lastLetter = stack.popLast(), lastLetter == "[" else {
                stack.append("fail")
                break
            }
        default:
            break
        }
    }
    
    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
}
