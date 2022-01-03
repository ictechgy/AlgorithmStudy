//
//  Maze_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/03.
//

struct Node: CustomStringConvertible {
    private var everVisitied = false
    private var everBlocked = false

    let isWall: Bool
    let isPath: Bool

    var description: String {
        if isWall {
            return "W"
        } else if everBlocked {
            return "B"
        } else if everVisitied {
            return "O"
        } else {
            return "X"
        }
    }

    var isVisited: Bool {
        get {
            everVisitied
        }
        set {
            everVisitied = newValue
        }
    }

    var isBlocked: Bool {
        get {
            everBlocked
        }
        set {
            everBlocked = newValue
        }
    }

    init(isWall: Bool) {
        self.isWall = isWall
        self.isPath = !isWall
    }
}

var wall: Node {
    Node(isWall: true)
}
var path: Node {
    Node(isWall: false)
}

var maze = [
    [path, path, path, path, path, path, path, wall],
    [path, wall, wall, path, wall, wall, path, wall],
    [path, wall, path, wall, path, path, path, wall],
    [path, wall, path, path, wall, wall, path, path],
    [path, wall, wall, wall, path, path, wall, wall],
    [path, wall, path, path, path, wall, path, wall],
    [path, path, path, wall, path, path, path, wall],
    [path, wall, wall, wall, path, wall, path, path]
]

let startPoint = maze[0][0]
let endPoint = maze[maze.count-1][maze.count-1]

func findMazePath(y: Int, x: Int) -> Bool {
    //base case with checking index
    guard y < maze.count, x < maze.count else { return false }
    guard y >= 0 , x >= 0 else { return false }
    //base case with checking state
    if maze[y][x].isWall { return false }
    if maze[y][x].isVisited { return false }

    maze[y][x].isVisited = true

    //goal
    if y == maze.count - 1 && x == maze.count - 1 {
        return true
    }

    let directions = [
        (y: y+1, x: x),
        (y: y-1, x: x),
        (y: y, x: x+1),
        (y: y, x: x-1)
    ]
    var isPassed = false

    directions.forEach { point in
        if findMazePath(y: point.y, x: point.x) {
            isPassed = true
        }
    }

    if isPassed {
        return true
    } else {
        maze[y][x].isBlocked = true
        return false
    }
}

print(findMazePath(y: 0, x: 0) ? "There is a way!" : "You died")
maze.forEach({ nodes in
    print(nodes)
})

