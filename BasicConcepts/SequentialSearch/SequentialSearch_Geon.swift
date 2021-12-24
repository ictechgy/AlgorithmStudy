//
//  SequentialSearch_Geon.swift
//  Excution
//
//  Created by 김준건 on 2021/12/24.
//

func search<T: Equatable>(into container: [T], target: T, startIndex: Int, endIndex: Int) -> Int? {
    if startIndex > endIndex {
        return nil
    } else if container[startIndex] == target {
        return startIndex
    } else {
        return search(into: container, target: target, startIndex: startIndex + 1, endIndex: endIndex)
    }
}

func search<T: Equatable>(into container: [T], target: T) -> Int? {
    for index in container.indices {
        if container[index] == target {
            return index
        }
    }
    return nil
}
