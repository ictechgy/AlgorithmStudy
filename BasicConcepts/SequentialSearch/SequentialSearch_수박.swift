//
//  SequentialSearch_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/23.
//

enum SearchError: Error {
    case elementIsNotExist
}

func sequentialSearchOnIteration<Element: Equatable>(
    element: Element,
    within array: [Element]
) -> Result<(index: Int, element: Element), Error> {
    for index in array.indices {
        if element == array[index] {
            return .success((index, array[index]))
        }
    }

    return .failure(SearchError.elementIsNotExist)
}

func sequentialSearchOnRecusion<Element: Equatable>(
    element: Element,
    within array: [Element]
) -> Result<(index: Int, element: Element), Error> {

    func recursion(
        target: Element,
        where index: Int,
        within array: [Element]
    ) -> Result<(index: Int, element: Element), Error> {
        if index >= array.count {
            return .failure(SearchError.elementIsNotExist)
        } else if array[index] == element {
            return .success((index, array[index]))
        } else {
            return recursion(target: element, where: index+1, within: array)
        }
    }

    return recursion(target: element, where: .zero, within: array)
}
