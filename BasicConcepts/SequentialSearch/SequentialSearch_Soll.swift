//
//  SequentialSearch_Soll.swift
//  AlgorithmStudy
//
//  Created by Dasoll Park on 2021/12/23.
//

import Foundation

func sequentialSearch(data: [Int], count: Int, target: Int) -> Int {
    for index in 0..<count {
        if data[index] == target {
            return index
        }
    }
    return -1
}

func sequentialSearch(data: [Int], begin: Int, end: Int, target: Int) -> Int {
    if begin > end {
        return -1
    } else if target == data[begin] {
        return begin
    } else {
        return sequentialSearch(data: data, begin: begin + 1, end: end, target: target)
    }
}
