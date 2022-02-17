//
//  7576_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/17.
//

/*
 토마토 문제는 대표적인 BFS 문제이다.
 
 두개의 큐를 이용하여 풀이
 1. 이미 익은 토마토들에 대한 큐(ripe tomato queue)와 다음날이 되면 익을 토마토들에 대한 큐(unripe tomato queue)를 둔다.
 2. '익은 토마토 큐'에서 요소들을 꺼내면서 BFS를 진행하고 인접한 토마토들 좌표는 '다음날이 되면 익을 토마토 큐'에 넣는다.
 3. '다음날이 되면 익을 토마토 큐'에서 '익은 토마토 큐'로 모든 요소를 이동시킨 뒤 날짜를 하나 더하고 '다음날이 되면 익을 토마토 큐'는 모든 요소를 제거한다.
 4. 이 과정을 '다음날이 되면 익을 토마토 큐'가 빌때까지 진행한다. (더이상 익을 토마토가 없다는 것)
 5. 마지막에 창고의 토마토들을 순회하면서 안익은 것이 있는지 조회한다.
 6. 안익은 것이 있다면 익을 수 없는 것이므로 -1을 출력하고 모든 토마토가 익었다면 계산된 날 수를 출력한다.
 */

//필요한 자료구조 정의
struct Queue<Element> {
    private var enqueueStack = Array<Element>()
    private var dequeueStack = Array<Element>()
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    mutating func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

struct Coord {
    let x: Int
    let y: Int
}

//입력
let sizeInputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let width = sizeInputs[0]
let height = sizeInputs[1]

var tomatoBox = [[Int]]()
for _ in 0..<height {
    tomatoBox.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

//풀이
var ripeTomatoQueue = Queue<Coord>() //익은 토마토 큐
var unripeTomatoQueue = Queue<Coord>() //안익은 토마토 큐

for row in tomatoBox.indices {
    for column in tomatoBox[row].indices {
        if tomatoBox[row][column] == 1 { //이미 익은 토마토가 있는 경우
            unripeTomatoQueue.enqueue(Coord(x: column, y: row)) //일단은 '안 익은 토마토 큐'에 넣는다.
        }
    }
}

var requiredNumberOfDays = -1 //이미 익은 토마토들을 처음에 '다음날이 되면 익을 토마토 큐'에 넣었기 때문에 보정을 위해 -1로 초기화
while !unripeTomatoQueue.isEmpty { //'다음날이 되면 익을 토마토 큐'가 비어있지 않다면
    ripeTomatoQueue = unripeTomatoQueue
    unripeTomatoQueue.removeAll()
    requiredNumberOfDays += 1 //해당 토마토들이 1일이 지나 익었다.
    
    while let ripeTomato = ripeTomatoQueue.dequeue() { //익은 토마토들을 시작으로 주변에 어떤 토마토들이 다음날에 익을지 확인해보자
        let adjacentCoord = [
            Coord(x: ripeTomato.x, y: ripeTomato.y - 1),
            Coord(x: ripeTomato.x + 1, y: ripeTomato.y),
            Coord(x: ripeTomato.x, y: ripeTomato.y + 1),
            Coord(x: ripeTomato.x - 1, y: ripeTomato.y)
        ]
        
        for adjacentTomato in adjacentCoord where
        adjacentTomato.x >= 0 && adjacentTomato.x < width &&
        adjacentTomato.y >= 0 && adjacentTomato.y < height &&
        tomatoBox[adjacentTomato.y][adjacentTomato.x] == 0 {
            //주변 토마토 중 안 익은 토마토가 있다면 해당 토마토는 이제 익을 토마토가 된다.
            unripeTomatoQueue.enqueue(adjacentTomato)
            tomatoBox[adjacentTomato.y][adjacentTomato.x] = 1 //일단 익은 것처럼 처리(중복 카운팅 방지)
        }
    }
} //repeat-while문으로 작성하는 것이 자연스러울 수도 있음

var areAllTheTomatoesRipe = true //모든 토마토들이 다 익었는가
for row in tomatoBox.indices {
    for column in tomatoBox[row].indices {
        if tomatoBox[row][column] == 0 { //만약 아직 안익은 토마토가 있다면
            areAllTheTomatoesRipe = false //모든 토마토를 익게 할 수 없다.
        }
    }
}

if areAllTheTomatoesRipe {
    print(requiredNumberOfDays)
} else {
    print(-1)
}
