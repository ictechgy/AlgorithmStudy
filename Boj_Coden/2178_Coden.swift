//
//  2178_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/17.
//

/*
 이 문제는 도착까지 걸리는 최소 칸 수를 셈해야 함 -> BFS
 */

struct Queue<Element> {
    private var enqueueStack = Array<Element>()
    private var dequeueStack = Array<Element>()
    
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

struct Coord: Equatable {
    let x: Int
    let y: Int
}

//입력
let sizeInputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let height = sizeInputs[0]
let width = sizeInputs[1]

var maze = [[Int]]()
for _ in 0..<height {
    maze.append(readLine()!.compactMap { $0.wholeNumberValue })
}

//풀이
let startingPoint = Coord(x: 0, y: 0)
let destinationPoint = Coord(x: width - 1, y: height - 1)
var queue = Queue<Coord>()
queue.enqueue(startingPoint)
maze[0][0] = 2 //시작점을 2로 마킹하여 방문 표시

while let currentCoord = queue.dequeue() {
    let adjacentCoord = [
        Coord(x: currentCoord.x, y: currentCoord.y - 1),
        Coord(x: currentCoord.x + 1, y: currentCoord.y),
        Coord(x: currentCoord.x, y: currentCoord.y + 1),
        Coord(x: currentCoord.x - 1, y: currentCoord.y)
    ]
    
    for nextCoord in adjacentCoord where
    nextCoord.x >= 0 && nextCoord.x < width &&
    nextCoord.y >= 0 && nextCoord.y < height &&
    maze[nextCoord.y][nextCoord.x] == 1 {
        queue.enqueue(nextCoord)
        maze[nextCoord.y][nextCoord.x] = maze[currentCoord.y][currentCoord.x] + 1 //거리 표시 겸 방문 표시
        
        if nextCoord == destinationPoint { //만약 해당 다음 지점이 목적지라면 탐색을 종료해도 됨
            queue.removeAll()
            break
        }
    }
}

print(maze[destinationPoint.y][destinationPoint.x] - 1) //시작점을 2로 체크하기 시작했으므로 1 빼야 함
