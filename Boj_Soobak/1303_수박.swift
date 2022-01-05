//
//  1303_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/05.
//

// 1. 아군과 적군을 구분해야하면서 카운팅을 했던 적이 있는지 확인할 노드가 필요함
// 2. 입력을 받고 이를 노드의 2차원 배열로 맵핑해줄 로직이 필요함
// 3. N명이 붙어있을 때, 재귀적으로 이게 얼만큼 뭉쳐잇는지 확인할 로직이 필요함
// 4. 각 진영의 위력을 N^2을 한 뒤 합쳐주는 로직이 필요함


// 1v
struct Node: CustomStringConvertible {
    var description: String {
        if isEnemy {
            return "X"
        } else {
            return "O"
        }
    }

    let isEnemy: Bool
    var isVisited = false

    init(_ character: Character) {
        if character == "B" {
            isEnemy = true
        } else {
            isEnemy = false
        }
    }
}


if let input = readLine() {
    let size = input.split(separator: " ").compactMap({ Int($0) })
    let width = size[0], height = size[1]

    var map = [[Node]]()
    for _ in 0..<height {
        guard let input = readLine() else { continue }

        let eachRow = input.map { Node($0) }
        map.append(eachRow)
    }

    //2v
    //map.forEach { nodes in
    //    print(nodes)
    //}

    var result = (ours: 0, enemy: 0)

    //4v
    for y in 0..<height {
        for x in 0..<width {
            let isEnemy = map[y][x].isEnemy
            let count = countingCellsInEiBlob(y: y, x: x, when: isEnemy, within: &map)

            if isEnemy {
                result.enemy += count * count
            } else {
                result.ours += count * count
            }
        }
    }

    //result
    print(result.ours.description + " " + result.enemy.description)
}

//3v
func countingCellsInEiBlob(
    y:Int, x:Int,
    when condition: Bool,
    within map: inout [[Node]]
) -> Int {
    guard y < map.count, x < map[0].count else { return .zero }
    guard y >= 0, x >= 0 else { return .zero }

    if map[y][x].isEnemy != condition { return .zero }
    if map[y][x].isVisited { return .zero }

    map[y][x].isVisited = true

    let directions = [
        (y: y-1, x: x),
        (y: y+1, x: x),
        (y: y, x: x-1),
        (y: y, x: x+1)
    ]

    return 1 + directions.reduce(0, { partialResult, point in
        partialResult +
        countingCellsInEiBlob(y: point.y, x: point.x, when: condition, within: &map)
    })
}

