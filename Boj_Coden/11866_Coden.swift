//
//  11866_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/09.
//

//큐를 쓴다면 enqueue와 dequeue만으로도 쉽게 구현 가능하겠지만.. Swift에는 큐가 없으니.. (Array는 removeFirst가 O(n)이고..)
//일단은 더블스택이나 아래 방법을 써볼 수 있을 것 같다.
//(배열을 원형 리스트? 큐? 처럼 쓰는 방법인데 시간 복잡도면에서 딱히 좋지 않다. 요소의 개수가 계속 n개이고 의미없는 공간에 대한 탐색이 계속 이루어지므로.)

let userInputs = readLine()!.split(separator: " ").map { Int($0)! }
let numberOfPeople = userInputs[0]
let rouletteValue = userInputs[1]

var queue = Array(1...numberOfPeople)
var pulledOutQueue = [Int]()

var pointer = -1
var count = 0
while pulledOutQueue.count < numberOfPeople {
    pointer = (pointer + 1) % numberOfPeople
    if queue[pointer] != 0 {
        count += 1
        if count == rouletteValue {
            pulledOutQueue.append(queue[pointer])
            queue[pointer] = 0
            count = 0
        }
    }
}

print("<\(pulledOutQueue.map{ $0.description }.joined(separator: ", "))>")
