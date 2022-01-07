//
//  2667_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/03.
//

/*
 단지번호 붙이기
 전형적인 DFS/BFS 문제이다.
 각 셀마다 탐색을 상하좌우로 해가면서 인접한 셀끼리 묶어 카운팅해주면 된다.
 주의 할 것은, 이미 카운팅 된 셀은 다시 계산되면 안되므로 다른 값으로 바꿔줘야 한다.
 
 Recursion을 이용한 DFS를 이용해보자
 */

enum Site {
    case vacantLot
    case landWithHouse
    
    var numberDescription: Int {
        switch self {
        case .vacantLot:
            return 0
        case .landWithHouse:
            return 1
        }
    }
}

//입력
let size = Int(readLine()!)!
var map = [[Int]]()
for _ in 0..<size {
    map.append(readLine()!.map { Int(String($0))! })
}

//풀이
let checkedHouse = 2

//특정 단지 내의 집 개수를 카운팅
func countHouse(x column: Int, y row: Int) -> Int {
    if column < 0 || column >= size || row < 0 || row >= size { //base case 1 - 범위 벗어남
        return 0
    } else if map[row][column] != Site.landWithHouse.numberDescription { //base case 2 - 집이 아닌 부지를 마주친 경우
        return 0
    } else { //recursive case - 집이 있는 땅을 마주한 경우
        map[row][column] = checkedHouse
        return 1
        + countHouse(x: column, y: row - 1)
        + countHouse(x: column + 1, y: row)
        + countHouse(x: column, y: row + 1)
        + countHouse(x: column - 1, y: row)
    }
}

var housingComplex = [Int]()
//모든 셀에 대하여 탐색
for row in map.indices {
    for column in map[row].indices {
        let numberOfHouses = countHouse(x: column, y: row)
        
        if numberOfHouses > 0 {
            housingComplex.append(numberOfHouses)
        }
    }
}

var result = "\(housingComplex.count)\n"
result += housingComplex.sorted { $0 < $1 }.map { String($0) }.joined(separator: "\n")
print(result)
