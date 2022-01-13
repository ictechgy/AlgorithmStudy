//
//  1759_수박.swift
//  AlgorithmStudy
//
//  Created by kjs on 2022/01/13.
//

let originOfVowel = ["a", "e", "i", "o", "u"]

var result = [String]()

if let input = readLine()?.split(separator: " ").compactMap({ Int($0 )}),
   let characters = readLine()?.split(separator: " ").map({ String($0) }).sorted() {
    let N = input[0]
    let vowels = originOfVowel.filter { characters.contains($0) }

    for index in 0...(characters.count-N) {
        build(string: "", index: index, desiredLength: N, vowels: vowels, map: characters)
    }

    print(result.joined(separator: "\n"))
}



func build(string: String, index: Int, desiredLength: Int, vowels: [String],map: [String]) {
    //base case for checking index
    guard index < map.count else { return }

    var string = string
    string += map[index]

    //base case for cheking buildedString
    if string.count == desiredLength {

        // condition 1
        if string.count < 3 {
            return
        }

        // condition 2
        let filteredVowel = string.filter { vowels.contains(String($0)) }
        if filteredVowel.count < 1 {
            return
        }

        // condition 3
        let filteredConsonant = string.filter { !vowels.contains(String($0)) }
        if filteredConsonant.count < 2 {
            return
        }

        result.append(string)

        return
    }

    for index in (index+1)..<map.count {
        build(string: string, index: index, desiredLength: desiredLength, vowels: vowels, map: map)
    }
}

