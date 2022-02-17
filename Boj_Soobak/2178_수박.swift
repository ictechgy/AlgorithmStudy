//
//  2178_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/02/18.
//

struct Node {
    var order = 0
    var isVisitied = false
    var isBlocked: Bool

    init(isBlocked: Bool) {
        self.isBlocked = isBlocked
    }
}

if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }),
   input.count >= 2 {
    // 1. prepare
    let height = input[0], width = input[1]
    var map = [[Node]]()

    for y in 0..<height {
        guard let input = readLine()?.map(String.init) else {
            continue
        }

        map.append([])
        for x in 0..<width {
            let isWall = input[x] == "0"
            map[y].append(Node(isBlocked: isWall))
        }
    }

    // 2. bfs
    let queue = Queue<(y: Int, x: Int)>()
    queue.enqueue((y: .zero, x: .zero))
    map[.zero][.zero].order = 1

    while queue.isEmpty == false {
        guard let (y, x) = queue.dequeue() else { break }

        map[y][x].isVisitied = true

        let directions = [
            (y: y+1, x: x),
            (y: y-1, x: x),
            (y: y, x: x+1),
            (y: y, x: x-1)
        ]

        directions
            .filter { (y: Int, x: Int) in
                y < height &&
                x < width &&
                y >= .zero &&
                x >= .zero &&
                map[y][x].isBlocked == false &&
                map[y][x].isVisitied == false
            }
            .forEach { nextPoint in
                map[nextPoint.y][nextPoint.x].order = map[y][x].order + 1
                map[nextPoint.y][nextPoint.x].isVisitied = true

                queue.enqueue(nextPoint)
            }
    }

    print(map[height-1][width-1].order)
}

class Queue<Element> {
    private var list = [Element]()
    var isEmpty: Bool {
        list.count == 0
    }

    func enqueue(_ element: Element) {
        list.append(element)
    }

    func dequeue() -> Element? {
        guard list.count >= 1 else { return nil }

        return list.removeFirst()
    }
}

