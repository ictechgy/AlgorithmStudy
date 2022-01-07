//
//  BinarySearch_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/23.
//

enum SearchError: Error {
    case elementIsNotExist
}

func binarySearchOnIteration<Element: Comparable>(
    element: Element,
    within array: [Element]
) -> Result<(index: Int, element: Element), Error> {
    var startIndex = 0
    var endIndex = array.count - 1
    var midIndex: Int {
        (startIndex + endIndex) / 2
    }

    while startIndex <= endIndex {
        let currentIndex = midIndex
        let currentTarget = array[currentIndex]

        if currentTarget == element {
            return .success((index: currentIndex, element: currentTarget))
        } else if currentTarget < element {
            startIndex = currentIndex + 1
        } else if currentTarget > element {
            endIndex = currentIndex - 1
        }
    }

    return .failure(SearchError.elementIsNotExist)
}

func binarySearchOnRecursion<Element: Comparable>(
    element: Element,
    from startIndex: Int,
    to endIndex: Int,
    within array: [Element]
) -> Result<(index: Int, element: Element), Error> {
    guard startIndex <= endIndex && startIndex < array.count else {
        return .failure(SearchError.elementIsNotExist)
    }

    let currentIndex = (startIndex + endIndex) / 2
    let currentTarget = array[currentIndex]

    if currentTarget == element {
        return .success((index: currentIndex, element: currentTarget))
    } else if currentTarget < element {
        return binarySearchOnRecursion(
            element: element,
            from: currentIndex + 1,
            to: endIndex,
            within: array
        )
    } else if currentTarget > element {
        return binarySearchOnRecursion(
            element: element,
            from: startIndex,
            to: endIndex - 1,
            within: array
        )
    }

    return .failure(SearchError.elementIsNotExist)
}
