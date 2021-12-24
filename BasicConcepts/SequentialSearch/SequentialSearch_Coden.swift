//
//  SequentialSearch_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/20.
//

/*
 순차탐색 구현
 순차탐색은 일반적으로 '정렬되지 않은 컬렉션' 속에서 원하는 값을 찾는 알고리즘이다.
 시간복잡도는 최악의 경우 O(n)이다. 
*/

//MARK: - Iterative version
func sequentialSearch<Element, Container>(for value: Element, in storage: Container) -> Container.Index? where Element: Equatable, Container: Collection, Container.Element == Element {
    for index in storage.indices {
        if storage[index] == value {
            return index
        }
    }
    
    return nil
}

//MARK: - Recursive version
func recursiveSeqSearch<Element, Container>(for value: Element, in storage: Container, from startIndex: Container.Index, to endIndex: Container.Index) -> Container.Index? where Element: Equatable, Container: Collection, Container.Element == Element, Container.Index: AdditiveArithmetic, Container.Index == Int {
    
    if startIndex > endIndex { //base case 1 - 모든 값을 조회했으나 찾지 못한 경우
        return nil
    } else if storage[startIndex] == value { //base case 2 - 값을 찾은 경우
        return startIndex
    } else { //recursive case - 값을 더 조회해봐야 하는 경우
        return recursiveSeqSearch(for: value, in: storage, from: startIndex + 1, to: endIndex)
    }
}
