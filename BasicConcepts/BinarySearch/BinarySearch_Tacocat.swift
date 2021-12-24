//
//  BinarySearch_Tacocat.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/24.
//

import Foundation

var data: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func binarySearch(start: Int, end: Int, target: Int) -> Int {
    if start > end {
        return -1
    } else {
        let number = (start + end) / 2
        
        if data[number] == target {
            return number
        } else if data[number] < target {
            return binarySearch(start: number, end: end, target: target)
        } else {
            return binarySearch(start: start, end: number, target: target)
        }
    }
}

let test = binarySearch(start: 0, end: 8, target: 4)
print(test)
