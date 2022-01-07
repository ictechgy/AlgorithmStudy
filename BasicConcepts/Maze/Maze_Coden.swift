//
//  Maze_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/24.
//

/*
 미로 찾기 문제는 DFS/BFS로 풀 수 있는 문제이다.
 여기서는 Recursion을 이용한 DFS로 풀어보려고 한다.
*/

let passage = "0"
let wall = "1"
var maze = [
    [0, 0, 0, 0, 0, 0, 0, 1],
    [0, 1, 1, 0, 1, 1, 0, 1],
    [0, 0, 0, 1, 0, 0, 0, 1],
    [0, 1, 0, 0, 1, 1, 0, 0],
    [0, 1, 1, 1, 0, 0, 1, 1],
    [0, 1, 0, 0, 0, 1, 0, 1],
    [0, 0, 0, 1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0, 1, 0, 0]
].map { $0.map { String($0) } }

//풀이
//길 표시를 위한 값들을 먼저 정의
let blockedPassage = "X"
let destination = "#"
enum Direction: String, CustomStringConvertible {
    case up = "↑"
    case down = "↓"
    case left = "←"
    case right = "→"
    
    var description: String {
        return self.rawValue
    }
}

@discardableResult
func findPath(x column: Int, y row: Int) -> Bool {
    if row < 0 || row > 7 || column < 0 || column > 7 { //base case 1 - 범위 벗어남
        return false
    } else if maze[row][column] != passage { //base case 2 - 해당 위치로 이동했는데 통로가 아닌 경우
        return false
    } else if row == 7 && column == 7 { //base case 3 - 목적지 도착
        maze[row][column] = destination
        return true
    } else { //recursive case - 이동한 위치가 통로인 경우
        maze[row][column] = Direction.up.description
        if findPath(x: column, y: row - 1) { return true }
        
        maze[row][column] = Direction.right.description
        if findPath(x: column + 1, y: row) { return true }
        
        maze[row][column] = Direction.down.description
        if findPath(x: column, y: row + 1) { return true }
        
        maze[row][column] = Direction.left.description
        if findPath(x: column - 1, y: row) { return true }
        
        //각각의 방향을 다 돌아봤는데도 출구로 가는 길이 없다면 현재 위치는 갈 수 없는 길
        maze[row][column] = blockedPassage
        return false
    }
}

func printMaze() {
    print(maze.map { $0.joined(separator: " ") }.joined(separator: "\n"))
    print()
}

printMaze()
findPath(x: 0, y: 0)
printMaze()
