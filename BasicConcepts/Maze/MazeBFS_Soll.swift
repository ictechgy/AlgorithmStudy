//
//  MazeBFS_Soll.swift
//  YagomStudy5th
//
//  Created by Dasoll Park on 2022/02/19.
//

import Foundation

struct Storage<T> {
    private var queue: [T] = []
    
    var count: Int {
        queue.count
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        queue.removeFirst()
    }
}

struct Position {
    var x: Int
    var y: Int
}

final class Maze {
    var maze: [[Int]] = [
        [0, 0, 0, 0, 1, 0, 0],
        [0, 1, 1, 0, 1, 0, 1],
        [0, 0, 1, 0, 0, 0, 0],
        [1, 0, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 1, 0, 0],
        [1, 0, 1, 1, 1, 1, 0],
        [0, 0 ,0, 0, 0, 0, 0]
    ]
    var current = Position(x: 0, y: 0)
    var storage: Storage<Position> = Storage()
    var isFound = false
    let sizeOfMaze = 7
    
    func start() {
        storage.enqueue(current)
        maze[0][0] = -1
        
        // && isFound == false 조건문을 통해 queue에 항목이 남아있어도 빠져나올수있도록 해준다.
        while storage.isEmpty == false && isFound == false {
            
            guard let currentPosition = storage.dequeue() else { return }
            
            for direction in 0..<4 {
                if movable(currentPosition, direction) {
                    
                    guard let nextPosition = move(currentPosition, direction) else { return }
                    
                    maze[nextPosition.x][nextPosition.y] = maze[currentPosition.x][currentPosition.y] - 1
                    
                    // 목적지를 찾은 경우 for문은 빠져나가도 while 문은 더 돈다
                    if nextPosition.x == sizeOfMaze - 1 && nextPosition.y == sizeOfMaze - 1 {
                        print("Found the path")
                        isFound = true
                        // storae removeAll()은 O(n)이다.
                        break
                    }
                    storage.enqueue(nextPosition)
                }
            }
        }
        maze.forEach { print($0) }
    }
    
    func movable(_ current: Position, _ direction: Int) -> Bool {
        var isValidCell = false
        
        switch direction {
        case 0:
            if current.x - 1 >= 0 {
                isValidCell = maze[current.x - 1][current.y] == 0
            }
        case 1:
            if current.y + 1 <= sizeOfMaze - 1 {
                isValidCell = maze[current.x][current.y + 1] == 0
            }
        case 2:
            if current.x + 1 <= sizeOfMaze - 1 {
                isValidCell = maze[current.x + 1][current.y] == 0
            }
            
        case 3:
            if current.y - 1 >= 0 {
                isValidCell = maze[current.x][current.y - 1] == 0
            }
        default:
            return isValidCell
        }
        return isValidCell
    }
    
    func move(_ current: Position, _ direction: Int) -> Position? {
        switch direction {
        case 0:
            return Position(x: current.x - 1, y: current.y)
        case 1:
            return Position(x: current.x, y: current.y + 1)
        case 2:
            return Position(x: current.x + 1, y: current.y)
        case 3:
            return Position(x: current.x, y: current.y - 1)
        default:
            return nil
        }
    }
}

let maze = Maze()
maze.start()
