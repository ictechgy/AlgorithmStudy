//
//  1303_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/03.
//

/*
 이 문제는 정해진 좌표 공간 내에서 동일한 값들이 얼마나 뭉쳐져 있는지 알아내야 한다.
 Counting Cells in a Blob 문제와 유사하며 DFS / BFS를 이용한 풀이가 가능하다.
 
 여기서는 모든 좌표공간 Cell에 대해 DFS를 시도하여 각 값들이 얼마나 뭉쳐져 있는지 알아낼 것이다.
 */

//입력
let sizeInput = readLine()!.split(separator: " ").map { Int($0)! }
let widthSize = sizeInput[0]
let heightSize = sizeInput[1]

var battlefield = [[Character]]() //전장 지도
for _ in 0..<heightSize {
    let row = Array(readLine()!) //Swift의 String은 Int 인덱스(subscript) 접근이 불가능하다. (만약 가능했다면 battlefield의 타입은 [String]이었어도 됐을 것)
    battlefield.append(row)  //때문에 입력받은 String을 Array로 변환했으며 이렇게 하면 String.Element 배열인 [Character]가 만들어진다.
}

//풀이
let allyColor: Character = "W"
let enemyColor: Character = "B"
let neutralColor: Character = "R" //이미 카운팅 된 사람은 제외해야 한다. - Red

var allyPower = 0
var enemyPower = 0

//특정 좌표에서 시작하여 해당 부분에 뭉쳐있는 팀의 숫자 카운트
func countNumberOfTeamMembers(x column: Int, y row: Int, color blobColor: Character) -> Int {
    if column < 0 || column >= widthSize || row < 0 || row >= heightSize { //base case 1 - 좌표 벗어남
        return 0
    } else if battlefield[row][column] == neutralColor { //base case 2 - 이미 셈을 한 곳
        return 0
    } else if battlefield[row][column] != blobColor { //base case 3 - 셈을 하고 있던 팀과 다른 팀을 만난 경우
        return 0
    } else { //recursive case - 동일한 팀원을 찾은 경우
        battlefield[row][column] = neutralColor
        return 1
        + countNumberOfTeamMembers(x: column, y: row - 1, color: blobColor)
        + countNumberOfTeamMembers(x: column + 1, y: row, color: blobColor)
        + countNumberOfTeamMembers(x: column, y: row + 1, color: blobColor)
        + countNumberOfTeamMembers(x: column - 1, y: row, color: blobColor)
    }
}

for row in battlefield.indices {
    for column in battlefield[row].indices {
        let teamColor = battlefield[row][column]  //countNumberOfTeamMembers 함수가 실행되면 셈이 된 곳은 neutralColor가 되므로 미리 저장해두기
        let numberOfTeamMembers = countNumberOfTeamMembers(x: column, y: row, color: teamColor)
        let teamPower = numberOfTeamMembers * numberOfTeamMembers
        
        if teamColor == allyColor {
            allyPower += teamPower
        } else {
            enemyPower += teamPower
        }
    }
}

print("\(allyPower) \(enemyPower)")
