//
//  SequentialSearch.swift
//  AlgorithmStudy_Exercise
//
//  Created by Do Yi Lee on 2021/12/24.
//

import Foundation

var data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func search(_ start: Int, _ end: Int, _ target: Int) -> Int {
    if start > end {
        return -1
    } else {
        let middle = (start + end) / 2
        if data[middle] == target {
            return middle
        }

        let index = search(start, middle - 1, target)
        
        if index != -1 {
            return index
        } else {
            return search(middle + 1, end, target)
        }
    }
}

print(search(0, 8, 5))
