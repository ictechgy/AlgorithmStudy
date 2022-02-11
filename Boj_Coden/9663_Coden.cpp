//
//  9663_Coden.cpp
//  AlgorithmStudy
//
//  Created by JINHONG AN on 2022/02/05.
//

//'백준 9663 N-Queen' swift버전이 풀리지 않아 cpp로 풀이해봅니다.(동일한 풀이방식 사용)
//결과: 풀림. Swift에 대한 시간고려가 안된것으로 파악됨
#include <bits/stdc++.h>
#define MAX 15
using namespace std;

bool isValidPosition(int row);
void deployQueen(int row);

int chessBoard[MAX]; //입력값은 14까지 들어올 수 있으며 1~14 인덱스 사용 예정
int numberOfCases = 0;
int size;

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    
    cin >> size;
    deployQueen(0);
    cout << numberOfCases;
    
    return 0;
}

//row에 배치된 퀸이 유효한가?
bool isValidPosition(int row) {
    if(row == 0) {
        return true;
    }
    
    for(int prevRow = 1; prevRow < row; prevRow++) {
        if(chessBoard[prevRow] == chessBoard[row] ||
           row - prevRow == abs(chessBoard[row] - chessBoard[prevRow])) {
            return false;
        }
    }
    
    return true;
}

//row행에 퀸이 배치된 이후 호출되는 함수
void deployQueen(int row) {
    if(!isValidPosition(row)) {
        return;
    } else if(row == size) {
        numberOfCases++;
        return;
    } else {
        for(int column = 1; column <= size; column++) {
            chessBoard[row + 1] = column;
            deployQueen(row + 1);
        }
    }
}
