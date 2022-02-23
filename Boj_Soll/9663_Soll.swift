//
//  9663_Soll.swift
//  SwiftStudy
//
//  Created by Dasoll Park on 2022/02/11.
//

import Foundation

final class NQueen {
    var maxLevel = 0
    var columns: [Int] = []
    var result = 0
    
    func solution() {
        maxLevel = Int(readLine()!)!
        columns = Array(repeating: 0, count: maxLevel + 1)
        nQueen(level: 0)
        print(result)
    }
    
    // 하나의 노드에 접근
    func nQueen(level: Int) -> Bool {
        if !promising(level: level) {
            return false
        } else if level == maxLevel {
            result += 1
            
            return false
        }
        for index in 1...maxLevel {
            columns[level + 1] = index
            
            // 다음 level의 노드에 접근
            if nQueen(level: level + 1) {
                return true
            }
        }
        return false
    }

    func promising(level: Int) -> Bool {
        if 1 < level {
            for index in 1..<level {
                if columns[index] == columns[level] {
                    return false
                } else if level - index == abs(columns[level] - columns[index]) {
                    return false
                }
            }
        }
        return true
    }
}
