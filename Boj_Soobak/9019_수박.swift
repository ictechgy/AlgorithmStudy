//
//  9019_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/02/20.
//

typealias DSLR = (_ n: Int) -> Int

func D(_ n: Int) -> Int {
    return (2 * n) % 10000
}

func S(_ n: Int) -> Int {
    return n == 0 ? 9999 : n-1
}

func L(_ n: Int) -> Int {
    let pulledN = (n % 1000) * 10
    let last = n / 1000
    return pulledN + last
}

func R(_ n: Int) -> Int {
    let pushedN = n / 10
    let first = (n % 10) * 1000
    return first + pushedN
}

let directions: [(DSLR, String)] = [
    (D, "D"),
    (S, "S"),
    (L, "L"),
    (R, "R")
]

if let inputLength = readLine().flatMap(Int.init) {
    var result = ""

    for _ in 0..<inputLength {
        guard let input = readLine()?
                .split(separator: " ")
                .compactMap({ Int($0) }) else {
                    break
                }

        let startNumber = input[0], targetNumber = input[1]

        var queue = Queue<(number: Int, flag: String)>()
        queue.enqueue((number: startNumber, flag: ""))

        var everVisitied = Array(repeating: false, count: 10000)
        everVisitied[startNumber] = true

        var inProgress = true
        while inProgress {
            guard let (number, currentFlag) = queue.dequeue() else { break }

            for (dslr, flag) in directions {
                let number = dslr(number)

                if everVisitied[number] {
                    continue
                }

                let flag = currentFlag + flag
                if number == targetNumber {
                    result += flag + "\n"
                    inProgress = false
                    break
                } else {
                    everVisitied[number] = true
                    queue.enqueue((number: number, flag: flag))
                }
            }
        }
    }

    print(result)
}

// MARK: - struct queue
struct Queue<Element> {
    private var list = [Element]()
    private var index = 0

    var isEmpty: Bool {
        return index >= list.count
    }

    mutating func enqueue(_ element: Element) {
        list.append(element)
    }

    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }

        defer {
            index += 1
        }

        return list[index]
    }
}

// MARK: - class queue
//class Queue<Element> {
//    private var list = [Element]()
//    private var index = 0
//
//    var isEmpty: Bool {
//        return index >= list.count
//    }
//
//    func enqueue(_ element: Element) {
//        list.append(element)
//    }
//
//    func dequeue() -> Element? {
//        if isEmpty {
//            return nil
//        }
//
//        defer {
//            index += 1
//        }
//
//        return list[index]
//    }
//}




