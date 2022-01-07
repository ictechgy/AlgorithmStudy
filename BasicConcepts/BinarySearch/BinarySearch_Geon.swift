//
//  SequentialSearch_Geon .swift
//  Excution
//
//  Created by 김준건 on 2021/12/24.
//

func search<T: Comparable>(into container: [T], target: T, startIndex: Int, endIndex: Int) -> Int? {
    let middle = (startIndex + endIndex) / 2

    if startIndex > endIndex {
        return nil
    } else if container[middle] == target {
        return middle
    } else if container[middle] < target {
        return search(into: container, target: target, startIndex: middle + 1, endIndex: endIndex)
    } else { 
        return search(into: container, target: target, startIndex: startIndex, endIndex: middle)
    }
    
}

func search<T: Comparable>(into container: [T], target: T) -> Int? {
    var startIndex = 0
    var endIndex = container.count - 1
    
    while startIndex < endIndex {
        let middle = (startIndex + endIndex) / 2
        
        if container[middle] == target {
            return middle
        } else if container[middle] < target {
            startIndex = middle + 1
        } else {
            endIndex = middle
        }
    }
    return nil
}
