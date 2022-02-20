//
//  15649_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/07.
//

/*
 N과 M (1)
 
 모든 경우의 수를 출력해야 하는 전형적인 DFS 문제이다.
 (N개 중에서 M개를 중복없이 순서있게 뽑는 순열문제로도 생각해볼 수 있다.)
 */

//입력
let numberInputs = readLine()!.compactMap { $0.wholeNumberValue }
let upperLimitOfNumbers = numberInputs[0]
let numberToPick = numberInputs[1]

//풀이
var usedNumberCheckBook = Array(repeating: false, count: upperLimitOfNumbers + 1) //사용된 숫자를 파악하기 위한 배열
usedNumberCheckBook[0] = true //숫자 0은 쓰지 않음
var sequence = Array(repeating: 0, count: numberToPick) //결과를 보여줄 수열(배열)

pickNumber(for: 0)

//재귀적으로 (특정 인덱스 위치에 들어갈) 숫자를 뽑으면서 답을 찾아나갈 함수
func pickNumber(for index: Int) {
    if index >= numberToPick { //base case - 필요한 숫자를 다 고른 경우
        print(sequence.map { $0.description }.joined(separator: " "))
        return
    } else { //recursive case - 필요한 숫자를 다 고르지 못했으며 현재 index 위치에 숫자를 더 채워야 하는 경우
        for number in 1...upperLimitOfNumbers where usedNumberCheckBook[number] == false {
            usedNumberCheckBook[number] = true
            sequence[index] = number
            pickNumber(for: index + 1)
            usedNumberCheckBook[number] = false
        }
    }
}
