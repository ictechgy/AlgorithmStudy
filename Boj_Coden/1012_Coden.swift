//
//  1012_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/06.
//

/*
 유기농 배추
 
 뭉쳐져 있는 배추 집단을 셈하면 되는 문제로써 DFS/BFS 풀이가 가능하다.
 여기에서는 DFS로 풀이해보고자 한다.
 
 1. 2차원배열의 처음부터 훑어가면서 배추가 심어져있는 곳을 찾는다.
 2. 배추를 찾은 경우 DFS를 이용하여 주변의 배추까지 모두 파악한다.
 3. 파악된 모든 배추를 없는 것으로 만들고 필요한 배추흰지렁이의 개수를 1 증가시킨다.
 4. 이 과정을 배열의 끝에 도달할 때까지 반복한다.
 */

enum Field { //밭의 상태에 대한 열거형
    case empty
    case cabbageExists
}

var requiredNumberOfWorms = 0
var cabbageField: [[Field]] = []
var width = 0
var height = 0

//입력 시작
let numberOfTestCase = Int(readLine()!)!

for _ in 1...numberOfTestCase { //테스트 케이스 수만큼 반복한다.
    let fieldInformation = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    width = fieldInformation[0] //가로 크기
    height = fieldInformation[1] //세로 크기
    let numberOfCabbage = fieldInformation[2] //심어져 있는 양배추의 개수
    
    cabbageField = Array(repeating: Array(repeating: Field.empty, count: width), count: height) //밭 만들기
    for _ in 1...numberOfCabbage {
        let position = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        let coordX = position[0]
        let coordY = position[1]
        
        cabbageField[coordY][coordX] = Field.cabbageExists
    }
    //밭에 대한 사전 설정 끝
    
    //탐색 시작
    requiredNumberOfWorms = 0
    for row in cabbageField.indices {
        for column in cabbageField[row].indices {
            if isCabbageClusterExist(x: column, y: row) {
                requiredNumberOfWorms += 1
            }
        }
    }
    print(requiredNumberOfWorms)
}

//재귀를 이용한 DFS로 배추군집을 파악할 함수
//군집 존재 여하에 따라 Bool값을 리턴한다.
func isCabbageClusterExist(x column: Int, y row: Int) -> Bool {
    if column < 0 || column >= width || row < 0 || row >= height { //base case 1 - 밭의 범위를 넘은 경우
        return false
    } else if cabbageField[row][column] == .empty { //base case 2 - 해당 구역은 비어있는 곳인 경우
        return false
    } else { //recursive case - 해당 구역에 양배추가 있는 경우
        cabbageField[row][column] = .empty  //확인했으니 없는 곳으로 처리
        
        //상하좌우에 대해 재귀적으로 확인
        _ = isCabbageClusterExist(x: column, y: row - 1)
        _ = isCabbageClusterExist(x: column + 1, y: row)
        _ = isCabbageClusterExist(x: column, y: row + 1)
        _ = isCabbageClusterExist(x: column - 1, y: row)
        
        return true
    }
}
