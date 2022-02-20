//
//  NQueensProblem_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/12.
//

/*
 N-Queens Problem은 대표적인 백트래킹/dfs 문제이다.
 말을 하나씩 놓아보면서 상태공간트리 깊은 level로 들어가도록 풀이하면 된다.
 유망(promising)하지 않은 노드는 탐색하지 않아도 되며 찾고자 하는 정답인 leaf 노드를 하나 이상 찾으면 된다.
 
 여기서는 사용자 입력 size에 따른 size * size 크기의 N-Queens Problem을 풀어보려고 한다.
 해는 하나만 찾아 볼 것이다.
 */

//입력
print("체스판의 가로 세로 길이를 입력하십시오: ", terminator: "")
let size = Int(readLine()!)!

//각 말들은 row당 하나씩 두는 것으로 하며 각각의 row에서 어느 column에 둔 것인지 1차원 배열로 추적하기로 한다.
let notYetPlaced = -1
var chessboard = [Int]()
for _ in 0...size { //체스판은 1 ~ size 인덱스를 사용 할 것이다.
    chessboard.append(notYetPlaced)
}

func isValidLocation(in row: Int) -> Bool { //말을 row행에 놓았을 때 해당 column 위치에 놓는 것이 유효한지 검증
    if row == 0 { return true } //0번 행은 존재하지 않으나 root노드이고 시작점이므로 언제나 유효하다고 봐야 함
    for prevRow in 1..<row {
        if chessboard[prevRow] == chessboard[row] || //같은 열에 놓임
            (row - prevRow) == abs(chessboard[row] - chessboard[prevRow]) { //대각선 위치에 있음
            return false
        }
    }
    return true
}

func deployQueen(in row: Int) -> Bool { //row 행에 말을 막 놓은 상태
    if !isValidLocation(in: row) { //base case 1 - row행의 column위치에 말을 놓는 것이 부적합한 경우
        return false
    } else if row == size { //base case 2 - 모든 말이 잘 놓인 경우
        return true
    } else { //recursive case - row 행에 놓은 말은 괜찮지만 아직 말을 더 놓아봐야 하는 경우
        for column in 1...size {
            chessboard[row + 1] = column
            if deployQueen(in: row + 1) { return true }
        }
        return false
    }
}

func printChessBoard() {
    for row in 1...size {
        for _ in 1..<chessboard[row] {
            print("☐",terminator: "")
        }
        print("♛", terminator: "")
        for _ in (chessboard[row] + 1)..<(size + 1) {
            print("☐",terminator: "")
        }
        print()
    }
}


_ = deployQueen(in: 0)
printChessBoard()
