//
//  SequentialSearch_Geon.swift
//  Excution
//
//  Created by 김준건 on 2021/12/24.
//

func search<T: Equatable>(into list: [T], target: T, begin: Int, end: Int) -> Int {
    if begin > end {
        return -1
    } else if list[begin] == target {
        return begin
    } else {
        return search(into: list, target: target, begin: begin + 1, end: end)
    }
}
