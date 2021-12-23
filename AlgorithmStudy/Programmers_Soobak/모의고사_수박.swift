//
//  모의고사_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2021/12/23.
//

func solution(_ answers:[Int]) -> [Int] {
    let patterns = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]

    var scoreBoard = [1: 0, 2: 0, 3: 0]

    for pattern in patterns {
        if let index = patterns.firstIndex(of: pattern) {
            let scoreIndex = index + 1

            var score = 0

            for index in answers.indices {
                let currentPick = pattern[index % pattern.count]

                if answers[index] == currentPick {
                    score += 1
                }
            }

            scoreBoard[scoreIndex] = score
        }
    }

    return scoreBoard
        .filter { (key: Int, value: Int) in
            value == scoreBoard.values.max()
        }
        .map { (key: Int, value: Int) in
            return key
        }
        .sorted()
}
