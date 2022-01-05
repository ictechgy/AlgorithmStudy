//
//  2667_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/05.
//

/*
1. 각각의 포인트에서 색칠이 된 것인지, 방문이 된 것인지를 확인할 값타입이(Node) 필요함
2. 입력값을 이러한 값타입의 2차원 배열로 맵핑할 로직이 필요함
3. 각각의 포인트에서 상하좌우를 재귀적으로 찾아가며 카운트를 해줄 함수가 필요함
    - 이 때 한번이라도 카운팅이 된 노드는 다시 카운팅이 되면 안됨. 재귀함수에서 미리 조치를 취해야함
4. 모든 포인트에 대해서, 카운트가 0이면 넘어가고 0이 아니면 이 양의 정수를 저장해놓을 배열과 로직이 필요함
5. 정수를 저장해놓은 배열의 카운트와 함께 각각의 요소를 계행하면서 프린트를 해줄 로직이 필요함
 */

// 1v
struct Node: CustomStringConvertible {
    //print 해보기용
    var description: String {
        if isFilled {
            return "O"
        } else {
            return " "
        }

    }

    let isFilled: Bool
    var isVisited = false

    init(_ character: Character) {
        if character == "0" {
            isFilled = false
        } else {
            isFilled = true
        }
    }
}

var countedComplexes = [Int]()

if let input = readLine(),
   let rectangleSize = Int(input) {

    var map = [[Node]]()

    // 2v
    for _ in 0..<rectangleSize {
        guard let input = readLine() else {
            continue
        }

        let eachRow = input.map { character in
            Node(character)
        }
        //print(eachRow)

        map.append(eachRow)
    }

    // 4v
    for y in 0..<rectangleSize {
        for x in 0..<rectangleSize {
            let count = countingHouseNearBy(y: y, x: x, on: &map)

            if count == .zero {
                continue
            } else {
                countedComplexes.append(count)
            }
        }
    }

    // 5v
    countedComplexes.sort()
    let result = countedComplexes
        .reduce(countedComplexes.count.description) { partialResult, eachCount in
            partialResult + "\n" + eachCount.description
        }

    //    print("----------------")
    //    map.forEach { nodes in
    //        print(nodes)
    //    }

    print(result)
}

// 3v
func countingHouseNearBy(y: Int, x: Int, on map: inout [[Node]]) -> Int {
    guard y < map.count, x < map.count else { return .zero }
    guard y >= 0, x >= 0 else { return .zero }

    if map[y][x].isVisited { return .zero }

    map[y][x].isVisited = true

    if map[y][x].isFilled {
        let directions = [
            (y: y-1, x: x),
            (y: y, x: x-1),
            (y: y, x: x+1),
            (y: y+1, x: x),
        ]
        return 1 + directions.reduce(0, { partialResult, point in
            return partialResult + countingHouseNearBy(y: point.y, x: point.x, on: &map)
        })
    } else {
        return .zero
    }
}

