//
//  NQueens_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/12.
//

class NQueens {
    private let boardSize: Int
    var vector: [Int]

    init(boardSize: Int) {
        self.boardSize = boardSize
        self.vector = Array(repeating: .zero, count: boardSize+1)
    }


    var result: Bool {
        defer {
            vector.removeFirst()
        }
        return queens(y: 0)
    }

    private func nonPromising(level: Int) -> State {
        guard level != 0 else { return .go }

        for index in 1..<level {
            if vector[level] == vector[index] {
                return .blocked
            } else if level - index == abs(vector[level] - vector[index]) {
                return .blocked
            }
        }

        if level == boardSize {
            return .reached
        } else {
            return .go
        }
    }


    private func queens(y: Int) -> Bool {
        let currentState = nonPromising(level: y)

        switch currentState {
        case .blocked:
            return false
        case .reached:
            return true
        case .go:
            for x in 0..<boardSize {
                vector[y + 1] = x
                if queens(y: y + 1) {
                    return true
                }
            }
        }

        return false
    }

    private enum State {
        case blocked
        case reached
        case go
    }
}

let queens = NQueens(boardSize: 10)
print( queens.result )
queens.vector.forEach { index in
    var string = Array(repeating: "X", count: queens.vector.count)
    string[index] = "O"
    print(string.joined(separator: " "))
}

