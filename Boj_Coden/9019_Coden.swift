//
//  9019_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/17.
//

/*
 모든 경우의 수를 다 탐색하면 되는 문제이다.
 단, 이 때 만들어지는 상태공간트리를 DFS로 탐색하는 것이 아닌 BFS로 탐색해야 한다.
 
 상태공간트리는 아래와 같이 그려진다.(각각의 '경우노드'에 대해 4개의 자식노드가 계속 붙는 방식)
 
                    시작 숫자
    D를 한 숫자    S를 한 숫자    L을 한 숫자    R을 한 숫자
 D적용 S적용 L적용 R적용  ....      ....     D적용 S적용 L적용 R적용
 */

struct Queue<Element> {
    private var container = Array<Element>()
    private var head = 0
    
    var isEmpty: Bool {
        return head >= container.count
    }
    
    mutating func enqueue(_ element: Element) {
        container.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        
        let element = container[head]
        head += 1
        
        if head >= 10000 { //head가 10000이 될 때 배열 0~9999의 만개는 제거해줘도 되는 공간이다.
            container.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    mutating func removeAll() {
        container.removeAll()
        head = 0
    }
}

//각각의 경우(상태공간트리 노드)에 대한 타입
struct Register {
    let number: Int
    let instructions: String
}

//각각의 명령어에 대한 함수
func multiply(_ number: Int) -> Int {
    return (number * 2) % 10000
}

func subtract(from number: Int) -> Int {
    if number == .zero {
        return 9999
    } else {
        return number - 1
    }
}

func shiftToLeft(_ number: Int) -> Int {
    if number < 1000 {
        return number * 10
    } else {
        let firstNumber = number / 1000
        let remainingNumber = number % 1000
        
        return remainingNumber * 10 + firstNumber
    }
}

func shiftToRight(_ number: Int) -> Int {
    let lastNumber = number % 10
    let remainingNumber = number / 10
    
    return remainingNumber + (lastNumber * 1000)
}

//입력 및 풀이
let numberOfTestCases = Int(readLine()!)!
var results = ""

for _ in 0..<numberOfTestCases { //테스트 케이스 수만큼 반복 진행
    let numberInputs = readLine()!.split(separator: " ").map { Int(String($0))! }
    let startingNumber = numberInputs[0]
    let targetNumber = numberInputs[1]
    
    let startingRegister = Register(number: startingNumber, instructions: "") //초기 상태
    var queue = Queue<Register>()
    queue.enqueue(startingRegister)
    
    var isFigureOutPathToNumber = Array(repeating: false, count: 10000) //(해당 숫자로 가기 위한)최단 경로가 파악된 노드는 중복하여 넣을 필요가 없다.
    isFigureOutPathToNumber[startingNumber] = true
    
    while let currentRegister = queue.dequeue() { //노드를 하나 꺼낸다.
        //MARK: - D
        let multipliedNumber = multiply(currentRegister.number)
        let multipliedRegister = Register(number: multipliedNumber, instructions: currentRegister.instructions + "D")
        
        if isFigureOutPathToNumber[multipliedNumber] == false { //방문한 적 없는 숫자인 경우
            if multipliedNumber == targetNumber {
                results += (multipliedRegister.instructions + "\n")
                break
            } else {
                queue.enqueue(multipliedRegister)
                isFigureOutPathToNumber[multipliedNumber] = true
            }
        }
        
        //MARK: - S
        let subtractedNumber = subtract(from: currentRegister.number)
        let subtractedRegister = Register(number: subtractedNumber, instructions: currentRegister.instructions + "S")
        
        if isFigureOutPathToNumber[subtractedNumber] == false {
            if subtractedNumber == targetNumber {
                results += (subtractedRegister.instructions + "\n")
                break
            } else {
                queue.enqueue(subtractedRegister)
                isFigureOutPathToNumber[subtractedNumber] = true
            }
        }
        
        //MARK: - L
        let leftShiftedNumber = shiftToLeft(currentRegister.number)
        let leftShiftedRegister = Register(number: leftShiftedNumber, instructions: currentRegister.instructions + "L")
        
        if isFigureOutPathToNumber[leftShiftedNumber] == false {
            if leftShiftedNumber == targetNumber {
                results += (leftShiftedRegister.instructions + "\n")
                break
            } else {
                queue.enqueue(leftShiftedRegister)
                isFigureOutPathToNumber[leftShiftedNumber] = true
            }
        }
        
        //MARK: - R
        let rightShiftedNumber = shiftToRight(currentRegister.number)
        let rightShiftedRegister = Register(number: rightShiftedNumber, instructions: currentRegister.instructions + "R")
        
        if isFigureOutPathToNumber[rightShiftedNumber] == false {
            if rightShiftedNumber == targetNumber {
                results += (rightShiftedRegister.instructions + "\n")
                break
            } else {
                queue.enqueue(rightShiftedRegister)
                isFigureOutPathToNumber[rightShiftedNumber] = true
            }
        }
    }
}

print(results)
