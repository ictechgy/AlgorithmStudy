//
//  BinarySearch_Soll.swift
//  AlgorithmStudy
//
//  Created by Dasoll Park on 2021/12/23.
//

import Foundation

func binarySearch(data: [Int], target: Int) -> Int {
    var begin = 0
    var end = data.count - 1
    var middle: Int
    
    while true {
        middle = (begin + end) / 2
        if begin > end {
            return -1
        }
        if data[middle] == target {
            return middle
        } else if data[middle] < target {
            begin = middle + 1
        } else {
            end = middle - 1
        }
    }
}

func binarySearch(data: [Int], target: Int, begin: Int, end: Int) -> Int {
    if begin > end {
        return -1
    } else {
        let middle = (begin + end) / 2
        if target == data[middle] {
            return middle
        } else if target < data[middle] {
            return binarySearch(data: data, target: target, begin: begin, end: middle - 1)
        } else {
            return binarySearch(data: data, target: target, begin: middle + 1, end: end)
        }
    }
}
