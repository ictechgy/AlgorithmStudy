//
//  10816_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2021/12/24.
//

/*
 숫자 카드 2
 이 문제는 M개로 주어지는 각각의 숫자들이 N개 요소의 배열 내에서 몇개나 있는지 찾아내는 문제
 
 풀이 1 - counting sort를 이용하는 방법
 1. 주어지는 N만큼의 배열 공간을 미리 확보해둔다. array.reserveCapacity(N)
 2. N개 요소의 배열을 처음부터 끝까지 읽으면서 나오는 숫자값을 인덱스로 사용한다. 그리고 해당 인덱스의 값에 1을 더한다. array[number] += 1
 3. 2번 과정까지 거치면 모든 숫자가 몇개 나왔는지 누적합이 구해진다.
 4. M개의 숫자들을 읽으면서 해당 값을 인덱스로 사용한다. 그리고 해당 인덱스에 해당하는 값을 단순히 출력한다. print(array[number])
 
 시간복잡도: O(N + M)
 
 풀이 2 - Dictionary(해싱)를 이용하는 방식
 1. N개의 숫자를 읽으면서 각각의 값에 대한 Dictionary를 만든다. 키값이 각각의 숫자가 되며 밸류값은 갯수가 된다. -> O(N)
    존재하지 않는 키값이었다면 밸류는 1로 시작, 이미 존재한다면 1씩 누적시키기
 2. M개 요소 배열을 읽으면서 각 숫자값을 Dictionary 키값으로 이용하여 밸류값을 출력한다. -> O(M)
 
 시간복잡도: O(N + M)
 
 풀이 3 - 정렬, 이진탐색, 재귀를 이용하는 방식
 1. N개의 숫자를 정렬한다. -> O(Nlog N)
 2. M의 숫자들을 읽으면서 이진탐색으로 찾는다. -> 각각 O(log N), 총 O(Mlog N)
 3. 숫자를 찾으면 양 옆으로 재귀를 이용하여 중복된 값들까지 다 찾아 카운팅한다. -> 최악 O(N)
 4. 카운팅된 수 출력
 
 시간복잡도: O(Mlog N + N)
 */


//풀이 2.
let n = Int(readLine()!)!
let userCards = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let targetCards = readLine()!.split(separator: " ").map { Int($0)! }

//사용자 카드를 Dictionary로 카운팅하며 저장
var userCardBook = [Int: Int]()
for cardNumber in userCards {
    if let cardCount = userCardBook[cardNumber] { //이미 카운팅이 되고있던 카드 숫자라면
        userCardBook[cardNumber] = cardCount + 1
    } else {  //처음 카운팅되는 경우라면
        userCardBook[cardNumber] = 1
    }
}

var result = ""
for cardNumber in targetCards {
    if let cardCount = userCardBook[cardNumber] { //해당 카드숫자가 유저에게 존재하는 것이라면
        result += cardCount.description
    } else { //유저에게 존재하지 않는 카드 숫자라면
        result += "0"
    }
    result += " "
}
print(result)


//아래는 시간초과로 인해 실제 제출한 코드
import Foundation
//라이노님의 Fast FileIO
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> Int {
        var now = read()
        var str = 0

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10,
              now != 32,
              now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }
}

let reader = FileIO()
let n = reader.readInt()
var userCards = [Int]()
for _ in 0..<n {
    userCards.append(reader.readInt())
}
let m = reader.readInt()
var targetCards = [Int]()
for _ in 0..<m {
    targetCards.append(reader.readInt())
}

//사용자 카드를 Dictionary로 카운팅하며 저장
var userCardBook = [Int: Int]()
for cardNumber in userCards {
    if let cardCount = userCardBook[cardNumber] { //이미 카운팅이 되고있던 카드 숫자라면
        userCardBook[cardNumber] = cardCount + 1
    } else {  //처음 카운팅되는 경우라면
        userCardBook[cardNumber] = 1
    }
}

var result = ""
for cardNumber in targetCards {
    if let cardCount = userCardBook[cardNumber] { //해당 카드숫자가 유저에게 존재하는 것이라면
        result += cardCount.description
    } else { //유저에게 존재하지 않는 카드 숫자라면
        result += "0"
    }
    result += " "
}
print(result)
