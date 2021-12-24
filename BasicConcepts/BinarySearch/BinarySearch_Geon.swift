//
//  SequentialSearch_Geon .swift
//  Excution
//
//  Created by 김준건 on 2021/12/24.
//

func search<T: BinaryInteger>(into list: [T], target: T, startIndex: Int, endIndex: Int) -> Int {
    let middle = startIndex + endIndex / 2
    if list[startIndex] == target {
        return startIndex
    } else if list[middle] > target {
        return search(into: list, target: target, startIndex: startIndex + 1, endIndex: middle)
    } else {
        return search(into: list, target: target, startIndex: middle, endIndex: endIndex)
    }
}
