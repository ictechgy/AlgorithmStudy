//
//  1012_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/13.
//

struct Node {
    let isFilled: Bool
    var isVisitied = false
}

var color: Node {
    Node(isFilled: true)
}

var empty: Node {
    Node(isFilled: false)
}

//테스트를 해야하는 밭의 갯수를 확인
if let testSize = readLine().flatMap({ Int($0 )}) {
    var result = [Int]()

    //테스트를 해야하는 밭의 갯수만큼 반복
    for _ in 0..<testSize {
        guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) else {
            continue
        }

        //밭의 사이즈 및 심어져있는 배추의 갯수
        let width = input[0], height = input[1]
        let occupiedPointSize = input[2]

        var map = Array(repeating: Array(repeating: empty, count: width), count: height)

        //심어져있는 배추의 갯수만큼 반복하면서 체크
        for _ in 0..<occupiedPointSize {
            guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) else {
                continue
            }

            let x = input[0], y = input[1]

            map[y][x] = color
        }

        //밭을 순회하면서 배추그룹을 카운팅
        var sum = 0
        for y in 0..<height {
            for x in 0..<width {
                sum += dfs(y: y, x: x, within: &map)
            }
        }

        //다음밭을 확인하기 위해 일단 현재 값은 저장
        result.append(sum)
    }

    let resultString = result.reduce("") { partialResult, int in
        partialResult + int.description + "\n"
    }

    print(resultString)
}

@discardableResult
func dfs(y: Int, x: Int, within map: inout [[Node]]) -> Int {
    guard y < map.count, x < map[0].count else { return .zero }
    guard y >= 0, x >= 0 else { return .zero }

    if map[y][x].isFilled == false { return .zero }
    if map[y][x].isVisitied { return .zero }

    map[y][x].isVisitied = true

    let directions = [
        (y: y-1, x: x),
        (y: y+1, x: x),
        (y: y, x: x-1),
        (y: y, x: x+1),
    ]

    directions.forEach { point in
        dfs(y: point.y, x: point.x, within: &map)
    }

    return 1
}
