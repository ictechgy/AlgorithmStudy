# 💻 알고리즘 스터디

+ 참여자: 🐶 [Coden](https://github.com/ictechgy), 😺 [타코캣](https://github.com/Ldoy), 🍅 [Soll](https://github.com/soll4u), 🌹 [Ellen](https://github.com/jcrescent61), 🍉 [수박](https://github.com/soo941226), 🔫 [Geon](https://github.com/jgkim1008), 🧅 [Chalotte](https://github.com/yaewonLee)

*🙏 Especially thanks to 🦜 [vivi](https://github.com/YebinKim), 💎 [Joey](https://github.com/joey-ful)*

&nbsp;   

## 목차

+ [🧭 진행 방향](#-진행-방향)



+ [💾 Github 이용 방식](#-github-이용-방식)
+ [🔥 진행 기록](#-진행-기록)
+ [💫 다루고자 하는 개념들](#-이-스터디를-통해-다루고자-하는-개념들)
+ [🚀 예상 커리큘럼](#-예상-커리큘럼)

&nbsp;   

## 🧭 진행 방향

+ **이 스터디는 당장의 코딩 테스트를 바로 준비하자는 목적보다는 개념과 이론 학습에 중점을 둘 예정입니다.**

+ 강의는 기본적으로 [권오흠 교수님 인프런 강의](https://www.inflearn.com/course/%ec%95%8c%ea%b3%a0%eb%a6%ac%ec%a6%98-%ea%b0%95%ec%a2%8c/)를 이용하며 필요한 경우 [권오흠 교수님 유튜브 강의](https://www.youtube.com/c/OhHeumKwon/videos)를 이용
  + 강의 pdf자료는 [이곳](http://www.kocw.net/home/search/kemView.do?kemId=1148815)을 참고해주세요
+ 강의 듣고 강의에서 나온 개념 구현 및 이와 관련된 문제 풀어오기
  + **강의 듣기, 개념 구현, 문제 풀기는 스터디 시간에 해오는 것이 아닙니다. 미리 해와야 합니다.**
  + *스터디 시간에 시간을 정해놓고 문제를 푸는 방식은 고려중입니다.*
  + 안풀리는 문제는 최대 2시간까지만 고민하고 답 찾아보기(꼭 2시간일 필요는 없습니다. 30분, 1시간 등 제한 시간은 본인이 정해봅시다.)
  + 문제로 이용할 사이트는 [백준](https://www.acmicpc.net/)과 [프로그래머스](https://programmers.co.kr/)입니다.(leetcode, codility등도 쓸지도..?)
+ 스터디에서는 강의에서 이해가 안갔던 것 이야기 하기
+ **개념 구현 및 문제 푼 것 등은 랜덤으로 발표시킬 것임.**
+ *레드-블랙 트리 및 허프만 코딩, 인프런에서 다뤄지지는 않았지만 유튜브에 있는 몇몇 내용들은 추후에 다룰 예정입니다.*

&nbsp;   

### 코드 작성 시 주의 사항
Wody가 말해준 것처럼, 알고리즘 풀 때에는 코드에 주석을 답시다. 
```swift
/*
이 문제는 ~을 물어보는 문제

방법
1. ~을 ~한다
2. 어쩌고저쩌고
3. 값을 결과로 반환한다.
-> 부가적으로 이 방법의 시간복잡도에 대해서도 써줍시다. 
*/

func solution(_:) {
// 1. ~을 ~한다.
코드...

// 2. 어쩌고저쩌고
코드....
}
```

&nbsp;   

## 💾 Github 이용 방식
참고: [단국대학교 알고리즘 스터디](https://github.com/DKU-STUDY/Algorithm)

&nbsp;

### 각 폴더 구조

+ BasicConcepts - 기본 개념 구현 내용들
  + 개념별로 하위 폴더를 구성한 뒤 그 안에 구현 파일을 넣습니다. 
  + 구현 폴더명은 대문자로 시작하여 camel case로 작성한다. ex) Stack, BinarySearchTree, HashTable
  + 구현 파일명은 `[상위폴더명_구현자닉네임].swift`로 합니다.
+ Programmers - 프로그래머스 푼 문제들
  + 각자 본인의 폴더를 생성한 뒤 내부에 본인이 푼 문제를 모아놓는다. ex) Programmers_Ellen 폴더, Programmers_Geon 폴더
  + 파일명은 `[문제명_구현자닉네임].swift`로 합니다.
+ Boj - 백준 푼 문제들
  + 각자 본인의 폴더를 생성한 뒤 내부에 본인이 푼 문제를 모아놓는다. ex) Boj_Ellen 폴더, Boj_Geon 폴더
  + 파일명은 `[문제번호_구현자닉네임].swift`로 합니다.

&nbsp;   

### Flow
+ 이 repo에 대한 collarborator 권한을 지닌 각 멤버는 본인의 branch를 판 뒤 그 곳에 코드를 작성/구현한다. 
+ 금요일 스터디 모임 때 이야기를 나눈 뒤 문제가 없으면 모든 branch를 main에 merge한다.(각자 알아서 merge시키기) 
&nbsp;
### Issue
+ 궁금한 것이나 문제가 발생한 것이 있으면 [Issue](https://github.com/ictechgy/AlgorithmStudy/issues)를 이용하도록 한다. Label 필수!
+ 자료구조/알고리즘 이슈 양식 - `[스택] pop이 잘 안돼요~~ / [다익스트라] 최단경로가 이상하게 구해져요~ `와 같이 자료구조명/알고리즘명 작성 후 제목 작성
+ 백준/프로그래머스 문제 풀던 중 발생한 이슈 양식 - `[10256-요세푸스 0] 자꾸 시간초과가 나요! / [level01-키패드 누르기] 런타임 오류가 발생해요! `와 같이 문제번호나 문제레벨 및 문제명 작성 후 제목작성
+ 내용에는 문제에 대한 링크를 꼭 넣기!
&nbsp;
### 커밋 규칙
+ boj: 문제명
+ programmers: 문제명
+ concepts: 알고리즘/자료구조 구현이름
+ 수정의 경우에도 prefix는 `boj || programmers || concepts`로 작성 해주세요. 
+ 그 외의 경우에는 chore를 써주세요.

&nbsp;   

## 🔥 진행 기록

| week | 미리 해오기 |
| :---: |:---| 
| 1주차(~2021-12-10)| 1. 시간복잡도에 대한 강의 두개-[첫번째](https://www.youtube.com/watch?v=kg-bcK1ygIA), [두번째](https://www.youtube.com/watch?v=SO7xhml3Np4)- 들어오기<br/>2. 백준 [입출력과 사칙연산 11문제](https://www.acmicpc.net/step/1) 모두 풀어오기<br/>3. 기본적인 자료구조(스택, 큐, 연결리스트) 구현해오기<br/>4. 백준 문제 풀어오기<br/>[10828-스택](https://www.acmicpc.net/problem/10828), [4949-균형잡힌 세상](https://www.acmicpc.net/problem/4949)<br/> [18258-큐 2](https://www.acmicpc.net/problem/18258), [11866-요세푸스 문제 0](https://www.acmicpc.net/problem/11866)  |
| 2주차(~2021-12-17)| 1. 알고리즘 강의 '순환 (Recursion) 의 개념과 기본 예제 1~3' 듣고 피보나치, 팩토리얼 재귀함수로 구현해오기. <br/> 2. 1주차에 다 하지 못한 내용 해오기|
| 3주차(~2021-12-24)| 1. '2주차 강의'에서 나온 아래 두 개념을 구현해보자<br/>&nbsp;&nbsp;&nbsp;&nbsp;- `순차 탐색`을 Swift로 구현해보기 - Iterative, Recursive<br/>&nbsp;&nbsp;&nbsp;&nbsp;- `이진 탐색`을 Swift로 구현해보기 - Iterative, Recursive<br/>2. 문제 풀어오기<br/>&nbsp;&nbsp;&nbsp;&nbsp;- [숫자 카드 2](https://www.acmicpc.net/problem/10816) 풀기<br/>&nbsp;&nbsp;&nbsp;&nbsp;- [완전탐색-모의고사](https://programmers.co.kr/learn/courses/30/parts/12230) 풀기<br/>• 다음주에 추가적으로 이야기 해볼 내용 - 피보나치, 팩토리얼 - Memoization, DP 찍먹<br/>&nbsp;&nbsp;&nbsp;&nbsp;▪︎ 재귀 최적화와 꼬리 재귀도 같이 알아보면 좋을 것 같다.|
| 4주차(~2022-01-07)| 1. 'Recursion 응용 - 미로찾기 1' 강의 듣기 <br/>&nbsp;&nbsp;&nbsp;&nbsp;- 강의에서 나오는 예제를 가지고 미로찾기 구현해보기<br/> 2. 'Recursion 응용 2' 강의 듣기<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 예제 2차원 배열을 가지고 Counting Cells in a Blob 구현해보기<br/>• **좌표 x, y에 대한 고민**<br/>• [백준 단지번호붙이기](https://www.acmicpc.net/problem/2667) 풀기<br/>• [백준 전쟁 - 전투](https://www.acmicpc.net/problem/1303) 풀기<br/>• [프로그래머스 - 수박수박수박수박수박수?](https://programmers.co.kr/learn/courses/30/lessons/12922) 풀기
| 5주차(~2022-01-14)| 1. 'N-Queens Problem' 강의 듣기 <br/>&nbsp;&nbsp;&nbsp;&nbsp;- 강의 내용대로 풀이 구현해보기<br/>• [백준 N-Queen](https://www.acmicpc.net/problem/9663) 풀기<br/>• [백준 유기농 배추](https://www.acmicpc.net/problem/1012) 풀기<br/>• [백준 암호 만들기](https://www.acmicpc.net/problem/1759) 풀기<br/>• [(Optional)백준 N과 M(1)](https://www.acmicpc.net/problem/15649) 풀기<br/>• [프로그래머스 타겟 넘버](https://programmers.co.kr/learn/courses/30/lessons/43165) 풀기

&nbsp;

<details>
<summary><b>1주차(2021-12-10) 진행내용<b/></summary>
<div markdown="1">
  
### 1. 시간복잡도란? 
  정의 : 알고리즘의 연산이 몇번 이루어지는지를 나타내는 것, 알고리즘이 얼마나 빠른지를 나타내는 것

실행시간은 실행환경에 따라 달라지므로 주로 연산의 실행 횟수를 입력 데이터 크기에 대한 함수로 표현한 것(최악의 경우, 또는 평균적인 경우를 가정)

- 최악의 경우 시간복잡도 → 주로 사용됨(평균 시간 복잡도 계산은 어렵기 때문)
- 평균 시간복잡도
  
&nbsp;   
### 2. 공간복잡도란?   
  시간 복잡도와 달리 실행환경의 메모리 공간을 따지는 분석법
  
프로그램을 실행시킨 후 완료하는 데 필요로하는 자원 공간의 양이다.
고정 공간과 가변 공간으로 나타낼 수 있다.
- 고정 공간: 입출력 횟수, 크기와 관계없는 공간
- 가변 공간: 알고리즘의 특정 인스턴스에 의존하는 크기를 가진 구조화 변수를 위해 필요로하는 공간, 동적으로 필요한 공간
  
출처 - [오늘도 MadPlay!](https://madplay.github.io/post/time-complexity-space-complexity)
  
&nbsp;   
### 3. 시간복잡도가 그리 중요할까?   
  시간은 금이다.   
  RAM과 같은 저장장치의 크기가 증가해서 공간복잡도는 이제 크게 신경을 안써줘도 됨
  
&nbsp;   
### 4. 시간복잡도는 어디에서 볼 수 있었을까?   
  iOS 프로그래밍 할때 함수들 공식문서에서 볼 수 있었다.    
  ![image](https://user-images.githubusercontent.com/39452092/145572133-ab51025f-a0ba-44fd-9323-4117ff6a0010.png)
  
&nbsp;   
### 5. 알고리즘 문제를 풀 때 !(강제 언래핑)를 쓰면 안되는걸까? (어느정도까지 코드 컨벤션을 둬야 할까?)
  + 문제 시간제한으로 인해 컨벤션까지 신경 쓸 여유가 없다. (리팩토링은 나중에 시간이 남으면 해도 되지 않을까?)
  + 알고리즘 문제는 어떤 입력이 들어올지 명확히 주어져 있기 때문에 강제 언래핑을 써도 된다고 생각한다.
  + 다만 `guard let`이나 `if let` 등 옵셔널과 옵셔널 바인딩을 필요에 따라 자주 쓰는 경우는 많았다.
  + 변수명도 잘 지어주는 것이 문제를 푸는 데에도 좋았던 것 같다.(내가 푼 것 다시 체크할 때 등)   
  (코딩 테스트 푼 것에 대해 면접에서 리뷰를 하는 경우 !를 막 쓴 것이 안좋은 요소가 될 수도 있다고 하는데 정말일까?)
  
&nbsp;   
### 6. 입출력 시간초과에 대해. -> 백준 큐2 문제
  [Issue #1 참고](https://github.com/ictechgy/AlgorithmStudy/issues/1)
  
&nbsp;   
### 7. 커밋 규칙 추가에 대해(커밋 규칙 지켜주세요, 이슈올리면 채팅에 말해주세요)
  처리 완료
  
&nbsp;   
### 8. 문제를 풀 때 `import Foundation`이 꼭 필요할까? 
  Swift Standard Library만을 이용해서 구현이 가능한 경우에는 import가 필요없다!
  Foundation을 가져오는 것 자체가 시간복잡도에 영향을 미치는 것인지는 잘 모르겠다.(import 자체는 컴파일 타임에만 영향이 있지 않을까?) 
  
&nbsp;   
### 9. `split(separator:)`와 `components(separatedBy:)`의 차이
  + split: Swift Standard Library에 존재
    + String 원문을 참조하고 있는 Substring 배열을 반환한다. 복사같은 과정이 없으므로 빠르다.
    + (Substring으로 받은 뒤 String으로 변환해서 쓰는게 빠르다!!)
  + components: Foundation Framework에 존재
    + String 배열 자체를 반환한다.    
  + 참고 링크
    + https://velog.io/@minni/Swift-split-VS-components
    + https://odong-tree.github.io/swift/2021/05/22/split&components/
  
&nbsp;   
### 10. 아래 문장의 시간복잡도는?
```c
for(i=1; i<n; i*=2) 
{
    //Do something
}
```
<img width="600" alt="스크린샷 2021-12-10 오후 8 28 14" src="https://user-images.githubusercontent.com/39452092/145567335-375f5bf2-7b0f-416e-81fc-6b5ecfd621e5.png">
  
  + 정의역-공역 관점에서(수박): 정의역과 공역의 관점에서 살펴보면 정의역은 n개가 있지만 이에 매칭되는 치역은 n개에 미치지 못한다. 때문에 시간복잡도는 `Θ(n)`이 아니다. 
  
  + 2의 곱셈 개수를 파악하는 관점에서(코든 - 위 스크린샷 참고): i값은 1부터 2, 4, 8, 16... 순서로 증가해 나간다. 이 때 우리가 주목해야 할 것은 변화하는 'i값 추적'이 아니라 'i의 시작값 1에 몇번의 2를 곱해야 n이 되느냐'이다. 이는 식으로 나타내면 `1*2^x = n` 이 되며 이 때 x의 값이 반복문의 실행횟수가 된다. 양변에 `log_2`를 취하면 `x = log_2 n`이 된다. 따라서 반복문의 시간복잡도는 `Θ(log_2 n)`이 된다. 
  + Θ와 O측면: 위의 반목문 시간복잡도는 Θ표기법에 의해 `Θ(log n)`이다. 이는 `O(log n)`이라고 말할 수도 있다. 하지만 Big-O 표기법 자체가 upper bound를 표현하기 때문에 위의 반복문은 `O(n)`, `O(n^2)` 시간복잡도를 가진다고 말할 수도 있다.
  
&nbsp;   
### 11. `SubString`을 `Int`로 바로 변환하는 것보다 `String`으로 변환한 뒤에 `Int`로 바꾸는 것이 더 빠르다!!!
  https://icksw.tistory.com/218
&nbsp;   
</div>
</details>
  
<details>
<summary><b>2주차(2021-12-17) 진행내용<b/></summary>
<div markdown="1">
  
### 1. Stack 구현에 대해

+ 메서드나 연산프로퍼티 명은 어느정도 ADT를 따라가는 것이 좋을 것 같다.



+ Stack 내부를 구성하는 방식은 `Array`를 쓸 수도 있고 `LinkedList`를 쓸 수도 있다. 

  + 시간 복잡도를 잘 따져보자

  

  + 내부에 어떤 방식으로 구현되어있는지는 캡슐화를 해주는 것이 좋을 것 같다.
  + `Array`로 구현할 때 `append`, `removeLast`, `popLast`의 연산복잡도를 고려하자. 
  + 특별한 연산이 필요하지 않다면 ADT 기능을 연산 프로퍼티로 구현하는 것도 나쁘지 않다. 

+ 제네릭을 쓰는 경우 제네릭명을 잘 생각해보자. Swift `Array`에서는 `Element`라는 이름을 쓰고 있다. 

+ `defer`도 적절히 쓰면 도움이 된다. 

+ 자료구조/알고리즘 구현 후 다른 사람들은 어떻게 구현했나 찾아보자!

&nbsp; 

### 2. Queue 구현에 대해

+ class로 구현하게 된다면 성능을 위해 `final`을 고려하자!



+ 큐를 만들 때 `dequeue`를 위한 `removeFirst`는 시간복잡도가 O(n)이다.

  + `dropFirst` O(1)를 쓰면 원본 `Array`를 잘라서 참조하는 형태이다. 참조하는 형태로 잘라내서 성능상 이점이 있지만.. 이후에 바로 쓰기는 불편할 수 있다. 때문에 원본에 Array로 만들어서 다시 할당해주는 것이 필요하다. (비슷하게 써볼 수 있는 메서드로는 `suffix`가 있다.)

  

  + `popFirst`는 Subsequence에서만 사용 가능하다. 

+ cpp에서는 STL이 있지만 Swift에서는 우리가 다 구현해야 한다.. 

&nbsp; 

### 3. 연결리스트에 대해

+ 경우에 따라 `head`뿐만 아니라 `tail`도 넣는 것이 시간복잡도면에서 좋다.



+ 이중연결리스트를 만드는 경우 순환참조에 유의하자.

+ Array는 capacity를 넘어가는 경우 공간을 2배로 재할당하고 기존 값을 복사해서 넣은 후 다음 값을 append한다. 하지만 연결리스트는 그런 사항을 고려하지 않아도 된다.

+ 맨 앞에 요소를 추가하거나 삭제하는 경우 Array는 일반적으로 O(n)시간복잡도를 가지지만 연결리스트는 O(1)이다.

  + 사실 배열에서 맨 앞에 요소를 추가하는 경우 0번 인덱스의 기존 값을 맨 뒤에 넣는 것으로 최적화가 가능하다.

  

  + 배열에서 맨 앞의 요소를 삭제하는 경우에도 맨 뒤의 요소를 맨 앞에 넣는 것으로 최적화가 가능하다.
  + 위의 두 경우는 순서가 상관 없는 경우에만 사용 가능한 최적화 방식이다. 

&nbsp; 

### 4. 1주차 백준 문제들 4개에 대해

+ **안풀리면 답을 보거나 / Issue로 남기자.**

+ 매번 `print()`문을 찍는 것보다 모아서 찍는 것이 더 빠르다. 

+ 숫자값을 `String`생성자에 넣어서 만드는 것과 `description`을 쓰는 것은 속도상 큰 차이가 나지 않는다. 

+ mutating하는 `struct`와 `class `중에서 `class`가 더 빠름(800ms 중후반 vs 700후반)

  + 아래의 테스트는 LinkedList를 `struct`, `class`, `final class`로 구현했을 때의 차이이다. (백준 큐 2 문제)

  <img width="80%" src="https://user-images.githubusercontent.com/39452092/146553730-7342e828-8d67-4df9-9c9e-186bd743f92e.png" />

  ➜ 왜 이런 결과가 나온걸까..? 

&nbsp;   

### 5. 재귀와 피보나치, 팩토리얼 

+ 무한 재귀에 주의하자. 



+ base case와 recursive case를 구분한 뒤 recursive case가 base case로 수렴하는지 잘 확인하자. 

+ 언제 반복문을 쓰고 언제 재귀를 써야할까? 

  + 일반적으로 재귀를 쓰면 코드가 더 깔끔해진다. (이는 나중에 다른 개념들을 구현하면서 알아보도록 하자)

  

  + 메모이제이션, 동적계획법을 써야 좋은 경우가 존재한다. (나중에 알아보자)

&nbsp;   

### 6. 피보나치, 팩토리얼 - Memoization, DP 찍먹

​	➜ 다음주로(재귀 최적화와 꼬리 재귀도 같이 알아보면 좋을 것 같다.)

&nbsp;   

### 7. Merge commit을 Revert할 때

+ merge commit은 단순히 revert가 불가능하다.

+ revert로 해당 커밋을 취소할 때 머지 되기 전 어떤 커밋으로 되돌아 갈 것인지를 지정해주어야 한다.  `-m`  옵션 필요! 
  
</div>
</details>
  
<details>
<summary><b>3주차(2021-12-24) 진행내용<b/></summary>
<div markdown="1">
  
## 정리
### 검색을 구현할 때 결과를 찾지 못하면 무엇을 반환?
- `Int` 인덱스 값 반환이 명시적인 경우에는`-1`을 반환할 수 있다. 

- 에러를 `throw`하는 것도 방법일 수 있다. 
- `Result`타입을 반환할 수 있다. 
- **`nil`을 반환할 수도 있다. 즉 반환값이 옵셔널!**

&nbsp;   

### 반복문과 재귀의 비교(소감)
- 타코캣 : 반복문이 재귀보다 더 이해하기 쉬운 느낌이 들었다. 반복문을 재귀보다 더 많이 썼기 때문에 익숙해서 그런 것 같다. 

- 수박: 재귀의 경우 파라미터가 많아져서 이름짓기가 곤란한 경우가 있었다. 특히 라벨링을 하고자 하는 경우 생각할 게 많아져서 잘 읽히지 않는 함수가 되거나 딱딱하게 읽히는 함수가 되어서 곤란했다. 하지만 하고 나면 로직 자체는 사람이 말하는 것처럼 쉽게 읽혀져서 좋았다. 반복문의 경우에는 컴퓨터가 말하는 걸 읽는 것 같아서 단순하게 느껴졌다 

- Geon :  재귀의 경우 반복문보다 좀더 리소스가 낭비되는 느낌?? 내부적으로 함수가 중첩적으로 실행되는 느낌이여서 한눈에 파악하기도 어려웠던것 같다.

&nbsp;

### 숫자 카드 2
- 로직에 문제가 없는데 시간초과가 나는 경우 Fast I/O를 적용해 볼 것. 

- [Issue #6](https://github.com/ictechgy/AlgorithmStudy/issues/6)

&nbsp; 

## Memoization, DP 찍먹
- 피보나치의 경우 값 기록을 통해 최적화를 할 수 있다! 

- **최적해의 부분 해가 그 부분에 대한 최적 해!**
- 나중에 자세히 알아봅시다~ 😆

&nbsp;

## 꼬리재귀와 재귀 최적화
- 일반적인 재귀는 함수가 반복적으로 호출됨에 따라 스택에 프레임이 계속 쌓이게 된다. 

    - 이는 오버헤드가 큰 작업이다. 
- 꼬리재귀를 쓰면 컴파일러가 최적화를 해준다! 
    - Swift의 경우 Xcode 설정이 필요하며 언어에 따라 다를 수 있다.

    - [티스토리 - jooing](https://joooing.tistory.com/entry/%EC%9E%AC%EA%B7%80-%E2%86%92-%EA%BC%AC%EB%A6%AC-%EC%9E%AC%EA%B7%80-Tail-Recursion)
- 꼬리 재귀 최적화의 대표적인 예로는 팩토리얼이 있다. 

&nbsp;

## 추후 확인하면 좋은 내용
1. String에서는 Int로 된 subscript를 쓸 수 없다! 

</div>
</details>  

  
<details>
<summary><b>4주차(2022-01-07) 진행내용<b/></summary>
<div markdown="1">
  
### 1. 2차원배열에 접근할 때 `x`와 `y`를 어떻게 쓰는게 좋을까? 

+ x를 행(row)에 대해 쓰고 y를 열(column)에 써도 상관은 없다. 하지만 나중에 헷갈릴 수 있다.
따라서 아래와 같이 사용하도록 하자. (데카르트 좌표계 사용 방식과 동일)

```swift
let visited = 2
maze[y][x] = visited
//y는 row (행 이동)
//x는 column (열 이동)
```
+ x, y를 쓰지 않고 row, column을 명시적으로 사용해도 된다.

&nbsp;

### 2. dfs
- 깊이 우선 탐색(Depth First Search)
- 완전탐색(Brute Force)에서 많이 사용됨 
- 일반적으로 `재귀`를 이용하여 구현(`스택`도 가능!)



|탐색 대상| 탐색 방법 |
|:---:|:---:|
|<img src = "https://i.imgur.com/8wC7A6I.png" width = "80%">|<img src = "https://i.imgur.com/ktSJDqq.png" width = "80%">|

&nbsp;

### 3. bfs
- 너비 우선 탐색(Breadth First Search)
- 일반적으로 `큐`를 이용하여 구현
- *물결 모양처럼 퍼져 나간다!*

| 좌표평면 탐색 | 트리 탐색 |
|:---:|:---:|
|<img src = "https://i.imgur.com/zLl2rBV.png" width="70%">|<img src = "https://i.imgur.com/h51EYMP.png" width = "90%">|

&nbsp; 

- **내가 찾는 해가 중간 노드에 있을 때는 `dfs`보다 `bfs`가 조금 더 효율적임**
  
    <img src = "https://i.imgur.com/1O5uXLO.png" width = "30%">

&nbsp;

### 4. N-Queens Problem
- dfs 대표문제 
- 상태공간트리를 그리고 이를 탐색하는 방식으로 풀 수 있다. 

<img src = "https://i.imgur.com/tZIrZci.png" width = "30%">

&nbsp;

### 5. N-Queens Problem 풀이 흐름

| step1 | step2 | step3 |
| :--------: | :--------: | :--------: |
|<img src = "https://i.imgur.com/6Zb228c.png" width = "100%">|<img src = "https://i.imgur.com/Sq9174H.png" width = "100%">|<img src = "https://i.imgur.com/hJPgRFl.png" width = "100%">|

- 이렇게 하다보면 특정 상황에서 퀸을 놓을 수 없다는 것을 알게됨. 
    - 이전으로 다시 돌아가서 새로운 위치에 퀸을 놓는 방식으로 탐색

- **이렇게 중간에 유망하지 않은 노드를 발견한 경우 되돌아가는 기법을 정확히는`백트래킹`이라고 한다.**
    - 이를 통해 어느정도 최적화를 시킬 수 있다.
- 이런 재귀를 반복하다보면 결국에는 답이 나온다.


| step4 | answer | 
| :--------: | :--------: |
| <img src = "https://i.imgur.com/aY7gOPi.png" width = "100%">  | <img src = "https://i.imgur.com/jvBRGhN.png" width = "100%">|


&nbsp;


- 트리와 함께 보는 dfs 

| 상태공간트리와 함께 | 상태공간트리만 |answer(leaf)|
| :--------: | :--------: | :--------:|
| <img src = "https://i.imgur.com/7co3Dlq.png" width = "100%">     | <img src = "https://i.imgur.com/WmdXKOc.png" width = "100%">     | <img src = "https://i.imgur.com/tHQ40xn.png" width = "100%">

&nbsp;


### 6. 배열을 sort할 때 기준을 부여할 수 있다. 
```swift
let array = [1, 3, 2]
array.sorted { $0 < $1 } //오름차순
array.sorted { $0 > $1 } //내림차순
```

&nbsp;

### 7. 입력값을 숫자로 변환할 때 꿀팁
- 입력이 `"5 2"` 일 때 `[5, 2]`로 변환해야 하는 경우

```swift
//이전
let size = readLine()!.compactMap { Int(String($0)) }
let size = readLine()!.split(separator: " ").map { Int(String($0))! } 
//SubString에서 Int로 바로 변환하는 것보다 String으로 먼저 변환 후 Int로 바꾸는 것이 더 빠름 - 1주차 정리 참고

//이후
let size = readLine()!.compactMap { $0.wholeNumberValue }
//다만 이 방법은 10 이상의 숫자가 들어오는 경우 사용할 수 없음
```

  
</div>
</details>

&nbsp;   

## 💫 이 스터디를 통해 다루고자 하는 개념들

+ 스택, 큐, 연결리스트, 이진검색트리, 힙, 우선순위 큐 등 기본 자료구조
  + *사실 '원형큐', '이중연결리스트'와 같이 더 다양한 자료구조들이 있습니다.*



+ 재귀
+ DFS, BFS
+ 완전탐색(Brute-Force) 및 백트래킹
+ 해시
+ 정렬 
  + bubble sort
  + insertion sort
  + selection sort
  + quick sort
  + merge sort
  + heap sort
  + counting sort
  + radix sort
+ 탐색
  + 이분 탐색
+ 동적 계획법
  + LCS
  + LIS
  + Knapsack Problem
+ 그리디
+ 투포인터
+ 최단경로
  + 벨만-포드
  + 다익스트라
  + 플로이드-와샬
+ MST
  + Kruskal
  + Prim
+ Union-Find
+ DAG
+ etc...
  + 순열
  + 시뮬레이션

&nbsp;   

## 🚀 예상 커리큘럼

+ 인프런 강의 내용 중 'Java에서의 정렬', '보충 강의'는 다루지 않습니다.
+ 숫자 번호가 주차별 진행 단위를 의미하는 것은 아닙니다.

&nbsp;   

1. **알고리즘의 분석**

   + 시간 복잡도와 점근적 분석법 

     + https://www.youtube.com/watch?v=kg-bcK1ygIA

     

     + https://www.youtube.com/watch?v=SO7xhml3Np4

   

   * 시간복잡도에 대해 얘기해보기

   

   * Swift 입출력 해보기(백준 입출력과 사칙연산 https://www.acmicpc.net/step/1)
   * 기본적인 자료구조 구현해보기(스택, 큐, 연결리스트)
     * ADT란 무엇일까요? 
   * 백준 스택 - https://www.acmicpc.net/step/11
   * 백준 큐 - https://www.acmicpc.net/step/12

   &nbsp;   

2. **순환의 개념과 기본 예제(1~3강)**

   * `피보나치, 팩토리얼`을 재귀적으로 구현해보기

   

   + `순차 탐색`을 Swift로 구현해보기 - Iterative, Recursive

   

   + `이진 탐색`을 Swift로 구현해보기 - Iterative, Recursive

   

   + 백준 이분탐색 - https://www.acmicpc.net/step/29

   

   + 백준 재귀 - https://www.acmicpc.net/step/19

   

   + 피보나치, 팩토리얼 Memoization/DP 찍먹(예정)

   &nbsp;   

3. **Recursion 응용 - 미로찾기** 

   * 예제 2차원 배열을 가지고 미로찾기 구현해보기

     * 이 때 좌표를 x, y로 주는 것에 대한 고민

   * 재귀로 미로찾기를 푸는 것은 DFS일까 BFS일까? 

   * 백준 DFS, BFS - https://www.acmicpc.net/step/24

   * 미로 풀기를 스택으로도 구현해볼까요?

     * (참고)권오흠 교수님 유튜브 영상 - https://www.youtube.com/watch?v=5Q3L_kNCzw0

   * 미로 풀기를 큐로도 구현해볼까요? - BFS

     * (참고)권오흠 교수님 유튜브 영상 - https://www.youtube.com/watch?v=16SLOYDCYuc

     &nbsp;   

4. **Recursion 응용 2**

   * 예제 2차원 배열을 가지고 Counting Cells in a Blob 구현해보기

   &nbsp;   

5. **Recursion 응용 3 - Backtracking**

   * N-Queens Problem을 재귀로 구현해보기

   

   * 스택으로도 구현할 수 있을까? 
   * 백준 백트래킹 - https://www.acmicpc.net/step/34
   * 하노이의 탑? 

   &nbsp;   

6. **Recursion 응용 4 - 멱집합**

   + 멱집합 구현하기

   

   + 상태공간트리는 재귀의 강력한 도구이다!

   &nbsp;   

7. **기본적인 정렬 알고리즘들, merge sort**

   + selection, bubble, insertion sort 구현하기

   

   + merge sort 구현하기
   + 백준 정렬 - https://www.acmicpc.net/step/9
   + 백준 분할정복 - https://www.acmicpc.net/step/20

   &nbsp;   

8. **quick sort**

   + quick sort 구현하기(pivot을 어떻게 정할 것인지는 알아서)

   

   + (참고) Swift에서의 sort 알고리즘에 대하여 - [ZeddiOS](https://zeddios.tistory.com/648), [Rhyno](https://jcsoohwancho.github.io/2019-11-20-Swift%EC%9D%98-%EA%B8%B0%EB%B3%B8-%EC%A0%95%EB%A0%AC-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-Timsort/)
   + 어떻게 pivot을 고르는 것이 좋을까?

   &nbsp;   

9. **heap, heap sort**

   + max-heap 자료구조 구현하기

     + 배열로 해보자(연결리스트로 구현할 수도 있을까?)
     + max-heapify는 recursive, iterative 두 버전 모두 구현해보자

     

   + heap sort 구현하기

   &nbsp;   

10. **priority queue, 정렬의 lower bound**

    + 우선순위 큐 구현하기

    

    + 백준 우선순위 큐 - https://www.acmicpc.net/step/13

    &nbsp;   

11. **sorting in linear time, counting sort, radix sort**

    + 학생 자료구조(이름, 점수, 주소 등)를 만들고 점수에 대한 counting sort 구현하기

    

    + 동일한 길이의 영어 문자열에 대해 radix sort 구현하기
    + 정렬의 stable과 unstable에 대해 이야기 해볼까요?

    &nbsp;   

12. **트리와 이진 트리, Binary Search Tree**

    + 이진 트리 자료구조 구현하기(배열 X)

    

    + inorder, preorder, postorder, level-order 순회 함수들 구현하고 테스트하기
    + 이진 트리의 한 예인 Expression Tree와 특정 순회 방식 - 어디서 많이 봤던 것 같은데, 어디서였을까?
      + level-order는 큐를 쓰는데, inorder, preorder, postorder는 꼭 재귀로만 가능할까?
    + Binary Search Tree 구현하기
      + Search함수는 Recursive/Iterative version 다 구현해보기
      + Successor를 찾는 함수뿐만 아니라 Predecessor를 찾는 함수도 구현해보기
      + insert, delete 함수 구현하기
    + 백준 트리 - https://www.acmicpc.net/step/23

    &nbsp;   

13. **해슁(3번째 강의는 17분 15초까지만)**

    + Hash Table 구현하기(해시함수, 충돌 해결 기법, 중복 허용여부 등은 각자 원하는 것으로)
      + search, insert, delete 구현

    + swift `Hashable`에 대해 이야기해보자
      + 언제 어디에서 사용되는가?
    + 프로그래머스 해시(고득점 kit) - https://programmers.co.kr/learn/courses/30/parts/12077

    &nbsp;   

14. **Graph, 그래프 BFS, DFS**

    + BFS 함수를 구현하여 방문 순서 출력하기

      + 그래프를 인접행렬로 표현할 것인지 인접리스트로 표현할 것인지는 자유

      

    + BFS 함수를 이용하여 '출발노드 s로부터 모든 다른 노드까지의 최단 경로 길이' 구하기

      + 최단 경로 출력 함수도 구현해보자

    + DFS 함수를 구현하여 방문 순서 출력하기

      + stack으로도 구현해보자

    + 프로그래머스 DFS/BFS(고득점 kit) - https://programmers.co.kr/learn/courses/30/parts/12421

    &nbsp;   

15. **DAG와 위상정렬**

    + 가장 먼저 나와야 할 노드를 찾는 방식으로 DAG 정렬 함수 구현하기

      + indegree가 0인 노드가 존재하지 않는다면?

      

    + 가장 뒤에 나와야 할 노드를 먼저 찾는 방식으로 DAG 정렬 함수 구현하기

    + 백준 위상정렬 - https://www.acmicpc.net/step/25

    &nbsp;   

16. **최소비용 신장 트리(MST)**

    + Generic MST 알고리즘에 대해 이야기해보자. 

      + 안전하다(safe)는 것은 무엇인가?
      + 컷과 크로스, 존중에 대하여

      

    + Union-Find 구현하기

      + weighted union과 path compression 적용하기

    + Kruskal 알고리즘 구현하기

    + Prim 알고리즘 구현하기

      + 우선순위 큐 이용하기

    + 백준 유니온 파인드 - https://www.acmicpc.net/step/14

    + 백준 최소 신장 트리 - https://www.acmicpc.net/step/15

    &nbsp;   

17. **최단 경로 알고리즘**

    + Relax에 대해 이야기해보자.

    

    + Bellman-Ford 알고리즘 구현하기
    + Dijkstra 알고리즘 구현하기
      + 우선순위 큐 이용하기
    + Floyd-Warshall 알고리즘 구현하기
    + 백준 최단경로 - https://www.acmicpc.net/step/26

    &nbsp;   

18. **동적계획법 1~3**

    + Memoization?

    

    + 피보나치 수를 계산하는 알고리즘 구현
      + Top-Down, Bottom-Up 방식 둘 다 구현
    + 이항 계수 계산 알고리즘 구현
      + Top-Down, Bottom-Up 방식 둘 다 구현
    + 행렬 경로 문제 알고리즘 구현
      + Top-Down, Bottom-Up 방식 둘 다 구현(Common Trick 선택은 자유)
      + 최단 경로에 대한 출력도 구현하자
    + 분할정복법과 동적계획법의 차이에 대해서 이야기해보자
    + "최적해의 일부분이 그 부분에 대한 최적해인가?"
      + 최단 경로와 최장 경로에 빗대어 생각해보자
    + 백준 동적 계획법1 - https://www.acmicpc.net/step/16

    &nbsp;   

19. **동적계획법 4~6**

    + 행렬 체인 곱셈 알고리즘 구현

      + 어떻게 해야 연산 횟수가 가장 적어지는가?

      

    + Longest Common Subsequence 길이를 구하는 알고리즘 구현

    + Knapsack 문제를 푸는 알고리즘 구현

      + 시간복잡도에 대해 이야기해보자

    + 백준 동적 계획법2 - https://www.acmicpc.net/step/17

    + 백준 동적 계획법과 최단거리 역추적 - https://www.acmicpc.net/step/41



