//
//  BinarySearch_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/21.
//

/*
 이진탐색 구현
 이진탐색은 '정렬된 컬렉션'에서 원하는 값을 찾는 알고리즘이다.
 시간복잡도는 일반적으로 O(log n)이다.
 */

//MARK: - Iterative version
func binarySearch<Element, Container>(for value: Element, in storage: Container) -> Container.Index? where Container: Collection, Container.Element == Element, Element: Comparable, Container.Index == Int {
    var leftIndex = 0
    var rightIndex = storage.count - 1
    
    while leftIndex <= rightIndex {
        let centerIndex = (leftIndex + rightIndex) / 2
        
        if storage[centerIndex] == value {
            return centerIndex
        } else if storage[centerIndex] > value {
            rightIndex = centerIndex - 1
        } else {
            leftIndex = centerIndex + 1
        }
    }
    
    return nil
}

//MARK: - Recursive version
func recursiveBinSearch<Element, Container>(for value: Element, in storage: Container, startIndex: Container.Index, endIndex: Container.Index) -> Container.Index? where Container: Collection, Container.Element == Element, Element: Comparable, Container.Index == Int {
    let centerIndex = (startIndex + endIndex) / 2
    
    if startIndex > endIndex { //base case 1 - 찾지 못한 경우
        return nil
    } else if storage[centerIndex] == value { //base case 2 - 원하는 값을 찾은 경우
        return centerIndex
    } else if storage[centerIndex] > value { //recursive case 1 - 앞의 절반을 다시 찾아봐야 하는 경우
        return recursiveBinSearch(for: value, in: storage, startIndex: startIndex, endIndex: centerIndex - 1)
    } else { //recursive case 2 - 뒤의 절반을 다시 찾아봐야 하는 경우
        return recursiveBinSearch(for: value, in: storage, startIndex: centerIndex + 1, endIndex: endIndex)
    }
}

