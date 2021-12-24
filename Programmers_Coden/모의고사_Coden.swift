//
//  모의고사_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/24.
//

/*
 이 문제는 각 사람의 점수가 몇점인지 모두 체크해야 하는 문제이다. -> 완전탐색
 반복문으로도 해결 가능하고 재귀로도 해결 가능하다.
 
 풀이
 1. 문제 정답 answers에 대해 모든 사람의 점수를 체크한다. -> 재귀 이용할 것임
 2. 그 중 최고점인 사람의 점수를 뽑아낸다.
 3. 첫번째 사람부터 세번째 사람까지 최고점과 동일한 점수일 경우 해당 사람의 번호를 반환할 배열에 차례대로 저장한다. -> 오름차순이 알아서 된다.
 4. 만들어진 배열을 반환한다.
 */

var answer = [Int]() //실제 정답을 담을 배열

func solution(_ answers:[Int]) -> [Int] {
    answer = answers
    //각 사람들의 정답
    let firstGuesses = [1, 2, 3, 4, 5]
    let secondGuesses = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdGuesses = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] 
    
    //각 사람들의 점수를 계산하고 순서대로 배열에 채점 결과를 저장
    var scoreResult = [Int]()
    scoreResult.append(checkScore(of: firstGuesses, answerIndex: .zero))
    scoreResult.append(checkScore(of: secondGuesses, answerIndex: .zero))
    scoreResult.append(checkScore(of: thirdGuesses, answerIndex: .zero))
    
    let maxScore = scoreResult.max()! //최고 점수를 뽑아낸다.
    var result = [Int]() //반환 할 결과 값
    
    //최고 점수와 동일한 점수를 가진 사람들의 번호를 result에 추가한다.
    for index in scoreResult.indices {
        if scoreResult[index] == maxScore {
            result.append(index + 1)
        }
    }
    
    return result
}

//특정 사람의 추측성 답안지에 대해 점수를 체크하여 반환한다.
func checkScore(of guesses: [Int], answerIndex: Int) -> Int{
    if answerIndex >= answer.count {                                        //base case - 모든 답 체크 완료
        return 0
    } else if guesses[answerIndex % guesses.count] == answer[answerIndex] { //recursive case 1 - 한 문제 맞춘 경우
        return 1 + checkScore(of: guesses, answerIndex: answerIndex + 1)
    } else {                                                                //recursive case 2 - 맞추지 못한 경우
        return checkScore(of: guesses, answerIndex: answerIndex + 1)
    }
}
