# 🥤 쥬스 메이커 프로젝트

## 📑 프로젝트 소개
- 여러가지의 과일 주스를 만들때마다 과일 창고의 재고를 관리하고, 이를 UI로 보여주는 앱입니다.

## 📍 목차
1. [팀원](#🧑🏻‍💻-팀원)
2. [순서도](#🔖-순서도)
3. [타임라인](#⏱-타임라인)
4. [실행 화면(기능 설명)](#💻-실행-화면기능-설명)
5. [트러블 슈팅](#🚀-트러블-슈팅)
6. [참고 링크](#📎-참고-링크)

## 🧑🏻‍💻 팀원
|애쉬|미니|
|:----:|:----:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/88357373/186843567-7b59d8c6-8f37-4858-8cf7-6c47d58ba9b0.png" alt="Ash" border="0" width="200">|<img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|
|<a href="https://github.com/ash-youu"> <center>*@ash-youu*</center></a> | <a href="https://github.com/leegyoungmin"> <center>*@leegyoungmin*</center></a>|

## 🔖 순서도
### Component Diagram
![](https://i.imgur.com/uIDvwAL.png)

### ClassDiagram
![](https://i.imgur.com/lLc61KZ.png)


## ⏱ 타임라인
<!-- : 시간 순으로 프로젝트의 주요 진행 척도를 표시 -->
<details>
    <summary>STEP 1</summary>
    <p>

- **2022.08.29**
  - 공식문서 학습

- **2022.08.30**
  - STEP1 구현
    ![CommitList](https://i.imgur.com/DaHEL9t.png)

- **2022.08.31**
    - PR 발송 및 공식문서 학습

- **2022.09.01**
    - STEP1 `README.md` 작성 및 공식문서 학습

- **2022.09.02**
  - 리뷰에 대한 수정
    ![CommitList2](https://i.imgur.com/KWYwkEU.png)
    
    </p>
</details>

<details>
    <summary>STEP 2</summary>
    <p>

- **2022.09.05**
    - iOS UI 앱개발 학습

- **2022.09.06**
    - STEP2 구현
    ![CommitList3](https://i.imgur.com/PGrs2ex.png)

- **2022.09.07**
    - STEP2 `README.md` 작성 및 PR 발송

- **2022.09.08**
    - STEP2 로직 수정
      ![](https://i.imgur.com/StzYdDJ.png)

    </p>
</details>

<details>
    <summary>STEP 3</summary>
    <p>
    
- **2022.09.12**
    - STEP3 UI 수정
    - 로직 구현

- **2022.09.13**
    - STEP3 로직 수정
    - STEP3 PR 발송
    
    ![](https://i.imgur.com/edV6wg6.png)

- **2022.09.15**
    - STEP3 리뷰에 따른 리팩토링 진행
    
    ![](https://i.imgur.com/QepVkvN.png)

- **2022.09.16**
    - STEP3 `README.md` 작성
    </p>
</details>

## 💻 실행 화면(기능 설명)
### 기능 설명
  - 음료 주문 및 이를 통해서 변경된 재고에 대한 값 반영
  - 각 버튼은 각각의 음료를 주문하는 버튼이다.
  - 이 버튼을 누르게 되면, 주스를 만들 수 있는 재고를 확인한 후 주스를 만들게 된다.
  - 이때, 주스를 만들고 난 후에는 필요한 재고들을 감소시키게 된다.
  - 또한, 화면에 보여지는 데이터도 바로 업데이트가 된다.
  
#### 노치형 기기 실행 화면
![](https://i.imgur.com/6sJqHVC.gif)

#### 홈버튼 보유 기기 실행 예시
![](https://i.imgur.com/cqhhiuv.png)

## 🚀 트러블 슈팅
- 너무 많은 `@IBOutlet` 변수 선언
  - 기존에는 과일별 재고 레이블을 개별 `@IBOultet` 변수로 선언하였습니다.
  - 이와 같이 작성하게 되는 경우, `JuiceMakerViewController`와 `ModifyViewController` 클래스에서 모든 레이블에 대한 변수를 선언하게 되어 너무 많은 `@IBOutlet` 변수를 선언하게 되는 문제가 발생했습니다. 
  - 또한, `forEach`문을 통해 레이블의 `text`값을 업데이트할 때에도 모든 개별 레이블을 취합해 배열로 재정의해주어야 하는 문제가 있었습니다.
  - `@IBOutlet`을 통해 레이블의 변수를 선언할 때, `[UILabel]` 타입의 `fruitLabels`로 선언될 수 있게 하였고, `forEach`문을 통해 값을 업데이트할 때에도 해당 배열을 활용하는 방법으로 수정하였습니다.
      ```swift
        // Before 
        @IBOutlet weak var strawberryStockLabel: UILabel!
        @IBOutlet weak var bananaStockLabel: UILabel!
        @IBOutlet weak var pineAppleStockLabel: UILabel!
        @IBOutlet weak var kiwiStockLabel: UILabel!
        @IBOutlet weak var mangoStockLabel: UILabel!

        // After
        @IBOutlet var fruitLabels: [UILabel]!
    ```

## 📎 참고 링크
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [왕초보를 위한 iOS 앱개발](https://yagom.net/courses/ios-starter-uikit/)
