//
//  타겟 넘버_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/07.
//

/*
 타겟 넘버

 전형적인 DFS 문제이다.
 입력으로 들어오는 숫자들에 대해 각각 한번은 양수, 한번은 음수로 판단한 뒤 누적시켜 나아가면 된다.
 상태공간트리에서 종단노드에 도착했을 때 이 누적시킨 합이 타겟 넘버와 같은지 비교하면 끝
*/

var availableNumbers: [Int] = []
var targetNumber = 0

var numberOfWays = 0 //방법의 수

func solution(_ numbers:[Int], _ target:Int) -> Int {
    availableNumbers = numbers
    targetNumber = target
    
    accumulateNumber(of: 0, to: 0) //0번 인덱스의 값부터 0에 누적시켜 나아가자
    
    return numberOfWays
}

//재귀적으로 돌아가며 index 위치의 값을 sum에 누적시켜 답을 찾아나갈 DFS 함수
func accumulateNumber(of index: Int, to sum: Int) {
    if index >= availableNumbers.count { //base case - 모든 숫자를 다 더한 경우
        if sum == targetNumber {
            numberOfWays += 1
        }
        return
    } else { //recursive case - 아직 더해볼 숫자가 남아있는 경우
        accumulateNumber(of: index + 1, to: sum + availableNumbers[index])
        accumulateNumber(of: index + 1, to: sum - availableNumbers[index])
    }
}
