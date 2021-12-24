//
//  수박수박수?_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/24.
//

func solution(_ n:Int) -> String {
    let length = n / 2

    var result = ""

    for _ in 0..<length {
        result += "수박"
    }

    if n % 2 == 1 {
        return result+"수"
    } else {
        return result
    }
}
