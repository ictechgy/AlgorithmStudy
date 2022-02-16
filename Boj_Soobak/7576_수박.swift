//
//  7576_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/02/17.
//

struct TomatoBox {
    var order = 0
    var isRiped = false
    var isBlocked: Bool

    init(isBlocked: Bool) {
        self.isBlocked = isBlocked
    }
}

if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }),
   input.count >= 2 {
    // 1. prepare
    let width = input[0], height = input[1]
    let queue = Queue<(y: Int, x: Int)>()
    var map = Array(
        repeating: Array(repeating: TomatoBox(isBlocked: false), count: width),
        count: height
    )

    for y in 0..<height {
        guard let extraInput = readLine()?
                .split(separator: " ")
                .compactMap({ Int($0)}) else {
                    continue
                }

        guard extraInput.count == width else {
            continue
        }

        for x in 0..<width {
            let value = extraInput[x]
            let isWall = value == -1
            let isRiped = value == 1

            if isWall {
                map[y][x].isBlocked = true
            }

            if isRiped {
                map[y][x].isRiped = true
                queue.enqueue((y: y, x: x))
            }
        }
    }

    //2 bfs
    var result = 0

    while queue.isEmpty == false {
        guard let (y, x) = queue.dequeue() else { break }

        let directions = [
            (y: y+1, x: x),
            (y: y-1, x: x),
            (y: y, x: x+1),
            (y: y, x: x-1)
        ]

        directions
            .filter { point in
                point.y < height &&
                point.x < width &&
                point.y >= .zero &&
                point.x >= .zero &&
                map[point.y][point.x].isBlocked == false &&
                map[point.y][point.x].isRiped == false
            }
            .forEach { nextPoint in
                map[nextPoint.y][nextPoint.x].isRiped = true
                map[nextPoint.y][nextPoint.x].order = map[y][x].order + 1
                result = map[nextPoint.y][nextPoint.x].order
                queue.enqueue(nextPoint)
            }
    }

    //3 check unreached point
    for row in map {
        for tomato in row {
            if tomato.isBlocked == false && tomato.isRiped == false {
                result = -1
                break
            }
        }
    }

    print(result)
}


// MARK: - Note
/*
 Queue를 struct로 mutating하게 만들면
 시간이 아슬아슬해서 서버 상태에 따라 성공하기도 하고 시간초과가 나기도 함
 class로 만들어서 heap을 쓰게 되면 잘 통과함
 */
class Queue<Element> {
    private let linkedList = LinkedList()

    var isEmpty: Bool {
        linkedList.head == nil
    }

    func enqueue(_ element: Element) {
        linkedList.append(element)
    }

    func dequeue() -> Element? {
        return linkedList.removeFirst()
    }

    private class Node {
        private(set) var value: Element
        weak var prev: Node?
        var next: Node?

        init(value: Element) {
            self.value = value
        }
    }

    private class LinkedList {
        private(set) var head: Node?
        private(set) weak var tail: Node?

        var isEmpty: Bool {
            return head == nil
        }

        func append(_ element: Element) {
            let newNode = Node(value: element)

            if isEmpty {
                head = newNode
            } else {
                tail?.next = newNode
                newNode.prev = tail
            }

            tail = newNode
        }

        func removeFirst() -> Element? {
            defer {
                head = head?.next
            }

            return head?.value
        }

        init() { }
    }
}

