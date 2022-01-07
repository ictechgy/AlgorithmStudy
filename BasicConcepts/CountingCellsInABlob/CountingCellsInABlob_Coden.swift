//
//  CountingCellsInABlob_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/03.
//

/*
 주어진 픽셀 그림에서 blob이 몇개인지 카운팅 하는 문제
 blob들 중 가장 큰 blob의 셀 개수를 알려달라 할 수도 있고 모든 blob에 대해 셀의 총 개수를 배열로 만들어 반환하라 할 수도 있다.
 
 Counting Cells in a Blob 문제는 DFS/BFS로 풀이 가능하다.
 여기서는 DFS를 이용한 풀이를 작성해보려 한다.
*/

//입력
let backgroundPixel = 0
let imagePixel = 1
var photo = [
    [1, 0, 0, 0, 0, 0, 0, 1],
    [0, 1, 1, 0, 0, 1, 0, 0],
    [1, 1, 0, 0, 1, 0, 1, 0],
    [0, 0, 0, 0, 0, 1, 0, 0],
    [0, 1, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 1, 0, 1, 0, 0],
    [1, 0, 0, 0, 1, 0, 0, 1],
    [0, 1, 1, 0, 0, 1, 1, 1]
]

//풀이
let checkedPixel = 2
var countingResult = [Int]()

func countCells(x column: Int, y row: Int) -> Int {
    if row < 0 || row > 7 || column < 0 || column > 7 { //base case 1 - 범위 벗어남
        return 0
    } else if photo[row][column] != imagePixel { //base case 2 - 이미지 픽셀이 아닌 부분에 도착
        return 0
    } else { //recursive case - 이미지 픽셀에 도착
        photo[row][column] = checkedPixel
        return 1
        + countCells(x: column, y: row - 1)
        + countCells(x: column + 1, y: row - 1)
        + countCells(x: column + 1, y: row)
        + countCells(x: column + 1, y: row + 1)
        + countCells(x: column, y: row + 1)
        + countCells(x: column - 1, y: row + 1)
        + countCells(x: column - 1, y: row)
        + countCells(x: column - 1, y: row - 1)
    } //12시 방향부터 시계방향으로 탐색
}


for row in photo.indices {
    for column in photo[row].indices {
        let result = countCells(x: column, y: row)
        if result > 0 {
            countingResult.append(result)
        }
    }
}

print(countingResult)
