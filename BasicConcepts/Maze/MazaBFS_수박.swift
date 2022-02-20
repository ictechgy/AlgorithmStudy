//
//  MazaBFS_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/02/15.
//

struct Node: CustomStringConvertible {
    var order = 0
    var isVisitied = false
    var isBlocked: Bool

    var description: String {
        if isBlocked {
            return "-"
        } else if isVisitied == false {
            return "X"
        } else {
            return order.description
        }
    }
}

var path: Node {
    Node(isBlocked: false)
}

var wall: Node {
    Node(isBlocked: true)
}

var map: [[Node]] = [
    [path, path, path, path, wall, path, path],
    [path, wall, wall, path, wall, path, wall],
    [path, path, wall, path, path, path, path],
    [wall, path, wall, wall, wall, wall, wall],
    [path, path, path, path, wall, path, path],
    [wall, path, wall, wall, wall, wall, path],
    [path, path, path, path, path, path, path]
]

var queue = Queue<(y: Int, x: Int)>()
queue.enqueue((y: .zero, x: .zero))

while queue.isEmpty == false {
    guard let (y, x) = queue.dequeue() else { break }
    map[y][x].isVisitied = true

    if y == map.count-1, x == map[y].count-1 {
        break
    }

    let directions = [
        (y: y+1, x: x),
        (y: y-1, x: x),
        (y: y, x: x+1),
        (y: y, x: x-1)
    ]

    directions
        .filter { (y: Int, x: Int) in
            y < map.count &&
            x < map[0].count &&
            y >= 0 &&
            x >= 0 &&
            map[y][x].isBlocked == false &&
            map[y][x].isVisitied == false
        }
        .forEach { (nextY: Int, nextX: Int) in
            map[nextY][nextX].order = map[y][x].order + 1
            queue.enqueue((nextY, nextX))
        }
}

map.forEach { row in
    print(row)
}




struct Queue<AnyType> {
    private var linkedList = LinkedList()

    var head: AnyType? {
        linkedList.head?.value
    }

    var tail: AnyType? {
        linkedList.tail?.value
    }

    var isEmpty: Bool {
        linkedList.head == nil
    }

    mutating func enqueue(_ value: AnyType) {
        linkedList.append(value)
    }

    mutating func dequeue() -> AnyType? {
        return linkedList.removeFirst()
    }
}

// MARK: - components
extension Queue {
    private class Node {
        private(set) var value: AnyType
        weak var prev: Node?
        var next: Node?

        init(value: AnyType, next: Node? = nil) {
            self.value = value
        }

        func updateValue(by value: AnyType) {
            self.value = value
        }
    }

    private struct LinkedList {
        private(set) var head: Node?
        private(set) weak var tail: Node?

        var isEmpty: Bool {
            return head == nil
        }

        mutating func append(_ value: AnyType) {
            let newNode = Node(value: value)

            if isEmpty {
                head = newNode
            } else {
                tail?.next = newNode
                newNode.prev = tail
            }

            tail = newNode
        }

        mutating func removeFirst() -> AnyType? {
            defer {
                head = head?.next
            }

            return head?.value
        }

        init() { }

        init(headValue: AnyType) {
            self.append(headValue)
        }
    }
}

