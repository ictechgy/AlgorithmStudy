//
//  Maze2_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/14.
//

/*
 미로 문제를 BFS로 풀이해보자.
 */

var maze = [
    [0, 0, 0, 0, 1, 0, 0],
    [0, 1, 1, 0, 1, 0, 1],
    [0, 0, 1, 0, 0, 0, 0],
    [1, 0, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1, 0, 0],
    [1, 0, 1, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0]
].map { $0.map { $0.description } }

//더블 스택을 이용한 큐 구현
struct Queue<Element> {
    private var enqueueStack = [Element]()
    private var dequeueStack = [Element]()
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    mutating func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

//좌표값을 나타내기 위한 자료구조
struct Coord {
    let x: Int
    let y: Int
}

//풀이
func printMaze() {
    print(
        maze
            .map { $0.joined(separator: "\t") }
            .joined(separator: "\n")
    )
    print()
}

//해당 지점으로 이동 가능한지 체크하는 함수
func isMovable(to coord: Coord) -> Bool {
    if coord.x < 0 || coord.x >= 7 ||
        coord.y < 0 || coord.y >= 7 ||
        maze[coord.y][coord.x] != "0" {
        return false
    } else {
        return true
    }
}

//BFS를 이용하여 출구를 찾는 함수
func findExit() {
    var queue = Queue<Coord>()
    let startingPoint = Coord(x: 0, y: 0)
    maze[startingPoint.y][startingPoint.x] = "-1" //방문 표시
    queue.enqueue(startingPoint)
    
    while let currentPoint = queue.dequeue() { //queue.isEmpty를 이용해도 됨
        let currentX = currentPoint.x
        let currentY = currentPoint.y
        let adjacentPoints = [
            Coord(x: currentX, y: currentY - 1),
            Coord(x: currentX + 1, y: currentY),
            Coord(x: currentX, y: currentY + 1),
            Coord(x: currentX - 1, y: currentY)
        ]
        
        for nextPoint in adjacentPoints {
            if isMovable(to: nextPoint) {
                maze[nextPoint.y][nextPoint.x] = (Int(maze[currentY][currentX])! - 1).description //방문 표시
                queue.enqueue(nextPoint)
            }
            
            if nextPoint.x == 6 && nextPoint.y == 6 { //해당 다음 지점이 출구라면
                queue.removeAll()
                break
            }
        }
    }
}

//경로를 역추적하여 출구까지 가는 화살표를 그려줄 함수
func tracePathBack(from coord: Coord) {
    if coord.x == 0 && coord.y == 0 { //base case - 출발지점 도착 시
        return
    } else { // recursive case - 더 추적해야 하는 경우
        let currentDistance = Int(maze[coord.y][coord.x])!
        let nextDistance = currentDistance + 1
        let adjacentPoints = [
            Coord(x: coord.x, y: coord.y - 1),
            Coord(x: coord.x + 1, y: coord.y),
            Coord(x: coord.x, y: coord.y + 1),
            Coord(x: coord.x - 1, y: coord.y)
        ]
        
        for (direction, nextPoint) in adjacentPoints.enumerated()
        where nextPoint.x >= 0 && nextPoint.x <= 6 &&
        nextPoint.y >= 0 && nextPoint.y <= 6 &&
        Int(maze[nextPoint.y][nextPoint.x])! == nextDistance {
            tracePathBack(from: nextPoint)
            
            if direction == 0 {
                maze[nextPoint.y][nextPoint.x] = "↓"
            } else if direction == 1 {
                maze[nextPoint.y][nextPoint.x] = "←"
            } else if direction == 2 {
                maze[nextPoint.y][nextPoint.x] = "↑"
            } else {
                maze[nextPoint.y][nextPoint.x] = "→"
            }
            
            break
        }
    }
}

printMaze()
findExit()
tracePathBack(from: Coord(x: 6, y: 6))
maze[6][6] = "x"
printMaze()

