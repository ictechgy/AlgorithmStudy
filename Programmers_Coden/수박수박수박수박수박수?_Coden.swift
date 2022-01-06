//
//  수박수박수박수박수박수?_Coden.swift
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/01/06.
//

/*
 주어지는 숫자 n의 길이에 맞춰 '수박' 글자를 반복하여 누적한 뒤 반환하는 문제
 n이 3이면 수박수
 n이 4이면 수박수박
 
 이 문제는 단순 구현문제.
 1. n이 짝수이면 n/2 만큼 '수박' 글자를 반복시키기
 2. n이 홀수이면 n/2 만큼 '수박' 글자를 반복시킨 뒤 맨 뒤에 '수' 붙이기
 */

func solution(_ length: Int) -> String { // n -> length로 네이밍 변경
    let watermelon = "수박"
    let numberOfRepetitions = length / 2 //기본적으로 n/2만큼은 반복해야 한다.
    var result = ""
    
    for _ in 0..<numberOfRepetitions { //length가 1로 주어지면 numberOfRepetitions는 0이 된다. 때문에 range를 1...numberOfRepetitions로 작성하면 안된다.
        result += watermelon
    }
    
    if length % 2 == 1 { //홀수의 길이가 주어졌던 경우라면
        result += String(watermelon.first!)
    }
    
    return result
}

