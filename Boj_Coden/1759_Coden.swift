//
//  1759_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/06.
//

/*
 암호 만들기
 
 이 문제는 전형적인 DFS 문제이다.
 1. 모든 경우의 수에 대해 탐색을 한다.
 2. 상태공간트리에서 종단노드에 도착했을 때 조건에 맞는 답인지 체크한다.
 3. 조건에 맞는다면 출력하고 조건에 맞지 않는다면 출력하지 않는다.
 */

//입력
let numberInput = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let alphabetInput = readLine()!.split(separator: " ").map { String($0) }

let lengthOfPassword = numberInput[0]
let numberOfAlphabets = numberInput[1]
let alphabets = alphabetInput.sorted() //오름차순 정렬

var password = Array(repeating: "", count: lengthOfPassword) //정답 출력을 위한 패스워드 배열

guessPassword(for: 0, alphabetStartIndex: 0, numberOfVowels: 0, numberOfConsonants: 0) //0번 인덱스 자리부터 탐색을 시작

//재귀 DFS로 암호를 찾아나갈 함수
//alphabetStartIndex - 오름차순 정렬된 알파벳들 중 어디까지 쓰였는지 체크하기 위한 수. 비밀번호의 다음글자는 이 인덱스에 해당하는 알파벳부터 사용 가능하다.
func guessPassword(for spot: Int, alphabetStartIndex: Int, numberOfVowels: Int, numberOfConsonants: Int) {
    if spot >= lengthOfPassword {                           //base case 1 - 암호가 일단 다 완성되어 인덱스(spot)가 암호 길이를 넘어간 경우
        if numberOfVowels >= 1 && numberOfConsonants >= 2 { //sub case 1 - 모음은 1개 이상, 자음은 2개 이상이어야 정답 조건 충족
            print(password.joined())
            return
        } else {                                            //sub case 2 - 암호는 완성됐지만 모음/자음 개수 조건을 충족하지 못하는 경우
            return
        }
    } else if alphabetStartIndex >= numberOfAlphabets {     //base case 2 - 암호가 완성되지 못해서 더 배치해봐야 하는데 사용가능한 뒤쪽 알파벳이 존재하지 않는 경우
        return
    } else {                                                //recursive case - 암호가 완성되지 않았으며 현재 위치에 배치 가능한 뒤쪽 알파벳이 남아있는 경우
        for index in alphabetStartIndex..<numberOfAlphabets {
            password[spot] = alphabets[index] //현재 패스워드 공간 하나에 알파벳 하나를 놓아본다.
            
            //암호의 뒤쪽에 대해 더 파악해본다.
            if ["a", "e", "i", "o", "u"].contains(alphabets[index]) {
                guessPassword(for: spot + 1, alphabetStartIndex: index + 1, numberOfVowels: numberOfVowels + 1, numberOfConsonants: numberOfConsonants)
            } else {
                guessPassword(for: spot + 1, alphabetStartIndex: index + 1, numberOfVowels: numberOfVowels, numberOfConsonants: numberOfConsonants + 1)
            }
        }
    }
}


