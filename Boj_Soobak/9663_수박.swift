//
//  9663_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/02/11.
//

if let N = readLine().flatMap({ Int($0) }) {
    let result = NQueens(N).excute()
    print(result)
}

final class NQueens {
    private let limitOfFirstRow: Int
    private var board: [Int]
    private var summary = 0

    private var isOdd: Bool
    private var extraSummary = 0

    init(_ N: Int) {
        self.board = Array(repeating: .zero, count: N)
        limitOfFirstRow = N/2

        if N % 2 == 1 {
            isOdd = true
        } else {
            isOdd = false
        }
    }

    func excute() -> Int {
        dfs(level: .zero)
        var result = summary * 2
        if isOdd {
            result += extraSummary
        }
        return result
    }

    private func dfs(level: Int) {
        if isOdd {
            if board[0] > limitOfFirstRow { return }
        } else {
            if board[0] >= limitOfFirstRow { return }
        }

        if level == board.count {
            if isOdd && board[0] == limitOfFirstRow {
                extraSummary += 1
            } else {
                summary += 1
            }
            return
        }

        for x in 0..<board.count {
            board[level] = x
            if isPossible(level) {
                dfs(level: level+1)
            }
        }
    }

    private func isPossible(_ level: Int) -> Bool {
        for index in 0..<level {
            if board[level] == board[index] {
                return false
            } else if level - index == abs(board[level] - board[index]) {
                return false
            }
        }

        return true
    }
}

