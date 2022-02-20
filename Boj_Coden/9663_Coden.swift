//
//  9663_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/12.
//

/*
 N-Queens Problem은 대표적인 백트래킹 / dfs 문제이다.
 이 문제에서는 가능한 모든 경우의 수를 구하라고 하고 있다.
 모든 경우(노드)를 탐색하는 dfs로 짜되 유망(promising)한 노드만 탐색하도록 할 것이다.(백트래킹)
 */

//입력
let size = Int(readLine()!)!

//한 row 행에는 하나의 말만 놓을 것이며 각각의 row에서 어떤 column에 말을 놓은 것인지 추적할 것이다.
var chessboard = [Int]()
for _ in 0...size { //행과 열은 1~size 인덱스를 사용 할 것이다.
    chessboard.append(0)
}

//row 행에 놓인 말이 유효한 것인지 체크
func isValidPosition(in row: Int) -> Bool {
    if row == 0 { //상태공간트리에서의 시작지점, root 노드여서 언제나 true여야 함
        return true
    }
    for prevRow in 1..<row {
        if chessboard[prevRow] == chessboard[row] || //열이 겹침
            (row - prevRow) == abs(chessboard[row] - chessboard[prevRow]) { //대각선에 위치 함
            return false
        }
    }
    return true
}

var numberOfCases = 0 //경우의 수 카운팅
//재귀적으로 상태공간트리를 탐색하며 해를 찾을 것이다.
func deployQueen(in row: Int) { //row행의 특정 column에 말을 놓은 상황
    if !isValidPosition(in: row) { //base case 1 - 유효하지 않은 위치라면
        return
    } else if row == size { //base case 2 - 말을 다 놓은 상황이고 유효한 형태라면
        numberOfCases += 1
        return
    } else { //recursive case - 지금 row에 놓은 말이 유효하기는 한데 말을 더 놓아봐야 하는 경우
        for column in 1...size {
            chessboard[row + 1] = column //다음 말을 둬보기
            deployQueen(in: row + 1)
        }
    }
}
deployQueen(in: 0)
print(numberOfCases)
