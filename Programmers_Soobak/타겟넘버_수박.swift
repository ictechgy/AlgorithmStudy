//
//  타겟넘버_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/13.
//

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    build(number: .zero, index: .zero, desiredNumber: target, origin: numbers, result: &result)
    return result
}

func build(number: Int, index: Int, desiredNumber: Int, origin: [Int], result: inout Int) {
    if index == origin.count {
        if number == desiredNumber {
            result += 1
        }
        return
    }

    let direction = [origin[index], -origin[index]]

    direction.forEach { int in
        let number = number + int
        build(
            number: number, index: index+1,
            desiredNumber: desiredNumber, origin: origin, result: &result
        )
    }
}
