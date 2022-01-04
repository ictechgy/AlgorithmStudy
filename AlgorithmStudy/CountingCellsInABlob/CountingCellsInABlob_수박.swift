//
//  CountingCellsInABlob_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/04.
//

struct Node: CustomStringConvertible {
    let isFilled: Bool
    var isVisited = false

    var description: String {
        if isFilled {
            return "O"
        } else if isVisited {
            return "X"
        } else {
            return " "
        }
    }
}

var color: Node {
    return Node(isFilled: true)
}

var empty: Node {
    return Node(isFilled: false)
}
var blobs: [[Node]] {
    [ // 8*8
        [color, empty, empty, empty, empty, empty, empty, color],
        [empty, color, color, empty, empty, color, empty, empty],
        [color, color, empty, empty, color, empty, color, empty],
        [empty, empty, empty, empty, empty, color, empty, empty],
        [empty, color, empty, color, empty, color, empty, empty],
        [empty, color, empty, color, empty, color, empty, empty],
        [color, empty, empty, empty, color, empty, empty, color],
        [empty, color, color, empty, empty, color, color, color]
    ]
}

var currentBlobs = blobs

func countingCellsEiBlob(y: Int, x: Int) -> Int {
    guard y < currentBlobs.count, x < currentBlobs.count else { return .zero }
    guard x >= 0, y >= 0 else { return .zero }

    if currentBlobs[y][x].isVisited { return .zero }

    currentBlobs[y][x].isVisited = true

    if currentBlobs[y][x].isFilled {

        let directions = [
            (y: y-1, x: x-1),
            (y: y-1, x: x),
            (y: y-1, x: x+1),
            (y: y, x: x-1),
            (y: y, x: x+1),
            (y: y+1, x: x-1),
            (y: y+1, x: x),
            (y: y+1, x: x+1),
        ]

        return 1 + directions.reduce(0, { (partialResult, point) in
            return partialResult + countingCellsEiBlob(y: point.y, x: point.x)
        })

    } else{
        return .zero
    }
}

for y in 0...7 {
    for x in 0...7 {
        currentBlobs = blobs
        let count = countingCellsEiBlob(y: y, x: x)
        if count > 0 {
            print("y: \(y), x: \(x), count: \(count)")
        }
    }
}

currentBlobs.forEach { nodes in
    print(nodes)
}
