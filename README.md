# π₯€ μ₯¬μ€ λ©μ΄μ»€ νλ‘μ νΈ

## π νλ‘μ νΈ μκ°
- μ¬λ¬κ°μ§μ κ³ΌμΌ μ£Όμ€λ₯Ό λ§λ€λλ§λ€ κ³ΌμΌ μ°½κ³ μ μ¬κ³ λ₯Ό κ΄λ¦¬νκ³ , μ΄λ₯Ό UIλ‘ λ³΄μ¬μ£Όλ μ±μλλ€.

## π λͺ©μ°¨
#### 1. [νμ](#π§π»βπ»-1-νμ)
#### 2. [μμλ](#π-2-μμλ)
#### 3. [νμλΌμΈ](#β±-3-νμλΌμΈ)
#### 4. [μ€ν νλ©΄(κΈ°λ₯ μ€λͺ)](#π»-4-μ€ν-νλ©΄κΈ°λ₯-μ€λͺ)
#### 5. [νΈλ¬λΈ μν](#π-5-νΈλ¬λΈ-μν)
#### 6. [μ°Έκ³  λ§ν¬](#π-6-μ°Έκ³ -λ§ν¬)

## π§π»βπ» 1. νμ
|μ μ¬|λ―Έλ|
|:----:|:----:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/88357373/186843567-7b59d8c6-8f37-4858-8cf7-6c47d58ba9b0.png" alt="Ash" border="0" width="200">|<img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|
|<a href="https://github.com/ash-youu"> <center>*@ash-youu*</center></a> | <a href="https://github.com/leegyoungmin"> <center>*@leegyoungmin*</center></a>|

## π 2. μμλ
### Component Diagram
![](https://i.imgur.com/uIDvwAL.png)

### FlowChart(Step1)
![](https://i.imgur.com/1qtpjeA.png)

### FlowChart(Step2)
![](https://i.imgur.com/hfa4SHD.png)

### FlowChart(Step3)
![](https://i.imgur.com/ANyvxkS.png)

### ClassDiagram
![](https://i.imgur.com/lLc61KZ.png)


## β± 3. νμλΌμΈ
<!-- : μκ° μμΌλ‘ νλ‘μ νΈμ μ£Όμ μ§ν μ²λλ₯Ό νμ -->
- **2022.08.29**
    - κ³΅μλ¬Έμ νμ΅

- **2022.08.30**
  - STEP1 κ΅¬ν
    ![CommitList](https://i.imgur.com/DaHEL9t.png)

- **2022.08.31**
    - PR λ°μ‘ λ° κ³΅μλ¬Έμ νμ΅

- **2022.09.01**
    - STEP1 `README.md` μμ± λ° κ³΅μλ¬Έμ νμ΅

- **2022.09.02**
  - μΆκ°μ μΈ λ¦¬λ·°μ λν μμ 
    ![CommitList2](https://i.imgur.com/KWYwkEU.png)
    
- **2022.09.05**
    - iOS UI μ±κ°λ° νμ΅

- **2022.09.06**
    - STEP2 κ΅¬ν
    ![CommitList3](https://i.imgur.com/PGrs2ex.png)

- **2022.09.07**
    - STEP2 `README.md` μμ± λ° PR λ°μ‘

- **2022.09.08**
    - STEP2 λ‘μ§ μμ 
      ![](https://i.imgur.com/StzYdDJ.png)

- **2022.09.12**
    - STEP3 UI μμ 
    - λ‘μ§ κ΅¬ν

- **2022.09.13**
    - STEP3 λ‘μ§ μμ 
    - STEP3 PR λ°μ‘
    
    ![](https://i.imgur.com/edV6wg6.png)

- **2022.09.15**
    - STEP3 λ¦¬λ·°μ λ°λ₯Έ λ¦¬ν©ν λ§ μ§ν
    
    ![](https://i.imgur.com/QepVkvN.png)

- **2022.09.16**
    - STEP3 `README.md` μμ±

## π» 4. μ€ν νλ©΄(κΈ°λ₯ μ€λͺ)
### π STEP 1
- μ₯¬μ€λ©μ΄μ»€λ‘ `makeJuice(juice:)` ν¨μ μ€ν
    ```swift
    class ViewController: UIViewController {
        private let maker = JuiceMaker()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            for _ in 1...20 {
                if let juice = Juice.allCases.randomElement() {
                    maker.makeJuice(juice: juice)
                }
            }
        }
    }
    ```
- `makeJuice(juice:)` λ° `haveStock(of:, over:)`,`increaseStock(of:, by:)` μ€λͺ
    ```swift
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks
        
        do {
        try fruitStore.haveStock(of: juiceNeedFruits, over: juiceNeedStocks)
        fruitStore.increaseStock(of: juiceNeedFruits, by: juiceNeedStocks)
        print("μ£Όλ¬Ένμ  \(juice.description) λμμ΅λλ€.")
        } catch StoreError.outOfStock {
            print("μ¬κ³ κ° λΆμ‘±ν©λλ€.")
        } catch {
            print("μ μ μλ μ€λ₯κ° λ°μνμμ΅λλ€.")
        }
    }
    ```
    - μ΄ ν¨μλ μ£Όμ€λ₯Ό λ§λλ λͺλ Ήμ λ΄λ¦¬λ ν¨μμλλ€.
    - μ΄ ν¨μμ κΈ°λ₯μ μ°½κ³ μ μ¬κ³ κ° μλμ§ νμΈ ν μλ€κ³  νλ¨νμ κ²½μ°μλ§ μ°½κ³ μ μ¬λ£λ₯Ό κ°μ Έμ μλ£λ₯Ό λ§λ€ λλ‘ μ€κ³νμμ΅λλ€.
    - λ§μ½, μ¬κ³ κ° μκ±°λ λΆμ‘±ν κ²½μ°μλ μλ¬λ₯Ό λ°μμν€λλ‘ νμμ΅λλ€.
    ```swift
    func haveStock(of fruits: [Fruit], over stocks: [Int]) throws {
        for (fruit, stock) in zip(fruits, stocks)  {
            guard let remainStock = inventory[fruit], remainStock >= -stock else {
                throw StoreError.outOfStock
            }
        }
    }
    ```
    
    - `haveStock(of:, over:)`μ μ£Όμ€λ₯Ό λ§λ€κΈ° μν΄μ νμν μ¬κ³ κ° μλμ§ νμΈνλ ν¨μμλλ€.
    - μ΄ ν¨μλ₯Ό νμ©νμ¬μ μ¬κ³ κ° μλ κ²½μ°μ μλ¬λ₯Ό λ°μμν€λλ‘ κ΅¬ννμμ΅λλ€.
    - λ§μ½, μ¬κ³ κ° μλ€λ©΄ ν¨μλ μ’λ£λκ² λμ΄, μλ¬λ₯Ό λ°μμν€μ§ μκΈ° λλ¬Έμ `makeJuice(juice:)`ν¨μμ λ€μ κ΅¬λ¬Έμ΄ μ€νλκ² λ©λλ€.
    ```swift
    func increaseStock(of fruits: [Fruit], by amounts: [Int]) {
        for (fruit, stock) in zip(fruits, amounts) {
            if let remainStock = inventory[fruit] {
                inventory.updateValue(remainStock + stock, forKey: fruit)
            }
        }
    }
    ```
    - `increaseStock(of:, by:)`μ μ¬κ³ κ° μλ μ£Όμ€λ₯Ό μμ±νκΈ° μν΄μ μ¬λ£λ₯Ό κΊΌλ΄μ€λ κ³Όμ μ ννν ν¨μμλλ€.
    - μ£Όμ€μ νμν μ¬λ£λ€κ³Ό μμ ν΅ν΄μ νμ¬ μ°½κ³ μ μ¬κ³ λ₯Ό μ€μ΄λ μ­ν μ λ΄λΉνκ² λ©λλ€.
    - λν, μ΄λ μμμ κ°μ΄ λ€μ΄μ€κ² λλ©΄, μ¬κ³ λ₯Ό μ¦κ°μν€λ ν¨μλ‘λ νμ©ν  μ μμ΅λλ€.
    
### π STEP 2
![FirstScreenGif](https://i.imgur.com/PpPOtS8.gif)

- μλ£ μ£Όλ¬Έ λ° μ΄λ₯Ό ν΅ν΄μ λ³κ²½λ μ¬κ³ μ λν κ° λ°μ
- κ° λ²νΌμ κ°κ°μ μλ£λ₯Ό μ£Όλ¬Ένλ λ²νΌμ΄λ€.
- μ΄ λ²νΌμ λλ₯΄κ² λλ©΄, μ£Όμ€λ₯Ό λ§λ€ μ μλ μ¬κ³ λ₯Ό νμΈν ν μ£Όμ€λ₯Ό λ§λ€κ² λλ€.
- μ΄λ, μ£Όμ€λ₯Ό λ§λ€κ³  λ νμλ νμν μ¬κ³ λ€μ κ°μμν€κ² λλ€.
- λν, νλ©΄μ λ³΄μ¬μ§λ λ°μ΄ν°λ λ°λ‘ μλ°μ΄νΈκ° λλ€.

### π STEP 3
- λΈμΉν κΈ°κΈ° μ€ν νλ©΄
![](https://i.imgur.com/6sJqHVC.gif)
- νλ²νΌ λ³΄μ  κΈ°κΈ° μ€ν μμ
![](https://i.imgur.com/cqhhiuv.png)
- κ° νλ©΄μμ 'μ¬κ³ μμ ' νΉμ 'λ«κΈ°' λ²νΌμ λλ₯΄λ κ²½μ°, μ μ ν νλ©΄μΌλ‘ μ νλλ€.
- μ¬κ³  μμ  νλ©΄μμ Stepperλ₯Ό μ΄μ©ν μλ λ³κ²½ μ λ©μΈ νλ©΄μμλ ν΄λΉ μλμΌλ‘ μλ°μ΄νΈ λλ€.
- μ€ν λ μ΄μμμ ν΅ν΄ μμ΄ν κΈ°μ’μ κΈ°κΈ°μμλ ν΅μΌλ νλ©΄μ΄ λ³΄μ¬μ§κ² λλ€.
## π 5. νΈλ¬λΈ μν
### π STEP 1
- `makeJuice()` μμ juiceλ³ ν¨μ νΈμΆμ λν λ¬Έμ 
  - κ°λ³ λ§€κ°λ³μλ₯Ό νμ©νλ λ°©λ²κ³Ό λ¦¬μ€νΈλ₯Ό λ°ννλ λ°©λ²
 
    ```swift
    // Before
    func makeJuice(juice: Juice) {
         switch juice {
            ...
         case .strawberrybananaJuice:
             if fruitStore.checkStock(fruit: .strawberry, stock: -10) &&
                 fruitStore.checkStock(fruit: .banana, stock: -1) {
                 fruitStore.changeStock(fruits: .strawberry, .banana, stocks: -10, -1)
             }
         case .mangokiwiJuice:
             if fruitStore.checkStock(fruit: .mango, stock: -2) &&
                 fruitStore.checkStock(fruit: .kiwi, stock: -1) {
                 fruitStore.changeStock(fruits: .mango, .kiwi, stocks: -2, -1)
             }
         }
     }

    // After
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks

        do {
        try fruitStore.haveStock(of: juiceNeedFruits, over: juiceNeedStocks)
        fruitStore.increaseStock(of: juiceNeedFruits, by: juiceNeedStocks)
        } catch StoreError.outOfStock {
            print("μ¬κ³ κ° λΆμ‘±ν©λλ€.")
        } catch {
            print("μ μ μλ μ€λ₯κ° λ°μνμμ΅λλ€.")
        }
    }
    ```
  - Beforeκ³Ό κ°μ΄ νΈμΆ μ `juice`μ μΌμ΄μ€ λ³λ‘ `haveStock()`κ³Ό `increaseStock()`μ κ°κ° νΈμΆν΄μ€μΌ νμ¬ μ½λμ μ€λ³΅λκ° λμμ§λ λ¬Έμ κ° μμμ΅λλ€.
  - `Juice` νμμμ μ£Όμ€ λ³λ‘ νμν κ³ΌμΌ(`needFruits`)κ³Ό μλ(`needStocks`)μ μ μΈνμ¬  `needFruitAndStock: [Fruit: Int]`μ Dictionary νμμ `haveStock()`κ³Ό `increaseStock()` λ΄λΆμμ νμ©νλ λ°©ν₯μΌλ‘ μμ νμμ΅λλ€.

### π STEP 2
- κ°μ²΄μ μ±κΈν€νμ λν κ³ λ―Ό
    - μ±κΈν€μ μ₯μ μλ ν λ²μ Instanceλ§ μμ±νμ¬μ λ©λͺ¨λ¦¬ λ­λΉλ₯Ό λ°©μ§ν  μ μμ΅λλ€. λν, λ€λ₯Έ μμλ€κ³Ό κ³΅μ κ° μ½λ€λ μ₯μ μ΄ μμ΅λλ€.
    - μ±κΈν€ μ¬μ©μ΄ μ λμ μΌλ‘ μ₯μ λ§ μλ κ²μ μλλλ€. μλ₯Ό λ€μ΄μ λ©μλμ λ³κ²½μ΄ μ΄λ£¨μ΄ μ§λ λ§λ€ μμ μ ν΄μΌ νλ λΆλΆμ΄ λ§μ΄ μκΈ΄λ€λμ§, λ§μ λ°μ΄ν°λ₯Ό κ³΅μ ν  κ²½μ° λ€λ₯Έ ν΄λμ€μ Instanceλ€ κ° κ²°ν©λκ° λμμ§κ² λ©λλ€.
    - λ€μν μ‘°κ±΄κ³Ό νλ‘μ νΈμ λ°©ν₯μ±μ λν λΌμλ₯Ό νμ¬μ νμ₯μ±μ μκ°νμμ λ, μΆκ°μ μΈ μ°½κ³  Instanceκ° μμ±λκ³ , 1νΈμ , 2νΈμ  λ±κ³Ό κ°μ νμ₯μμ κ²°ν©λκ° λμμ§ κ²μ΄λΌκ³  νλ¨νμ¬μ μ±κΈν€μ μ¬μ©νλ κ²λ³΄λ€λ `JuiceMaker` νμμ΄ `FruitStore` νμμ μμ νκ³  μλλ‘ νμμ΅λλ€.

- NotificationCenter νμ© μ νλ‘νΌν° μ΄κΈ°κ° μ€μ μ΄ λΆκ°ν λ¬Έμ 
    ```swift
    class FruitStore {
        private var inventory: [Fruit: Int] = Fruit.beginningStock {
            didSet {
                NotificationCenter.default.post(
                            name: Notification.Name.stockChanged,
                            object: nil,
                            userInfo: inventory
                        )
            }
          }
    }
    ```
  - `FruitStore`μ `inventory` κ° λ³νλ₯Ό νλ‘νΌν° κ°μμ(`didSet`) λ΄μ NotificationCenterλ₯Ό μ¬μ©ν΄ `JuiceMakerViewController`μ μ λ¬νλ λ°©μμ μ¬μ©νμ΅λλ€.
  - μ΄μ κ°μ΄ μ§ν μ `inventory` κ°μ΄ λ³ν  λμλ§ NotificationCenterμ `post`νκ² λμ΄ `λ§μλ μ₯¬μ€λ₯Ό λ§λ€μ΄ λλ €μ!` Viewμμ μ΄κΈ°κ°μ λ°μμ΄ μ΄λ €μ΄ λ¬Έμ κ° μμμ΅λλ€.
  - μ±μ΄ μλ‘ μΌμ§ λλ§λ€ κ³ΌμΌμ μλμ λͺ¨λ 10μΌλ‘ μ΄κΈ°νλκΈ° λλ¬Έμ View λ΄μμ κ³ΌμΌλ³ `StockLabel`μ 10μΌλ‘ μ€μ νκ³ , μ΄ν `inventory`μ κ°μ΄ λ³κ²½λ  λλ§λ€ `didSet`μ ν΅ν΄ `StockLabel.text`κ° μμ λ  μ μλλ‘ νμ΅λλ€.

### π STEP 3
- λλ¬΄ λ§μ `@IBOutlet` λ³μ μ μΈ
  - κΈ°μ‘΄μλ κ³ΌμΌλ³ μ¬κ³  λ μ΄λΈμ κ°λ³ `@IBOultet` λ³μλ‘ μ μΈνμμ΅λλ€.
  - μ΄μ κ°μ΄ μμ±νκ² λλ κ²½μ°, `JuiceMakerViewController`μ `ModifyViewController` ν΄λμ€μμ λͺ¨λ  λ μ΄λΈμ λν λ³μλ₯Ό μ μΈνκ² λμ΄ λλ¬΄ λ§μ `@IBOutlet` λ³μλ₯Ό μ μΈνκ² λλ λ¬Έμ κ° λ°μνμ΅λλ€. 
  - λν, `forEach`λ¬Έμ ν΅ν΄ λ μ΄λΈμ `text`κ°μ μλ°μ΄νΈν  λμλ λͺ¨λ  κ°λ³ λ μ΄λΈμ μ·¨ν©ν΄ λ°°μ΄λ‘ μ¬μ μν΄μ£Όμ΄μΌ νλ λ¬Έμ κ° μμμ΅λλ€.
  - `@IBOutlet`μ ν΅ν΄ λ μ΄λΈμ λ³μλ₯Ό μ μΈν  λ, `[UILabel]` νμμ `fruitLabels`λ‘ μ μΈλ  μ μκ² νμκ³ , `forEach`λ¬Έμ ν΅ν΄ κ°μ μλ°μ΄νΈν  λμλ ν΄λΉ λ°°μ΄μ νμ©νλ λ°©λ²μΌλ‘ μμ νμμ΅λλ€.
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

- `NotificationCenter`λ₯Ό ν΅ν μ΅μ λΉ ν¨ν΄κ³Ό μμ‘΄μ± μ£Όμ
    - `STEP 2` μμ λ°μνμλ μ΄κΈ°ν λ¨κ³μμ νμ©ν  μ μμλ λ¬Έμ μ λλ²μ§Έ νλ©΄μμ λ°μ΄ν°λ₯Ό μ λ¬νκ³  λκ°μ λ·° μ»¨νΈλ‘€λ¬κ° κ°μ λ°μ΄ν°λ₯Ό μ¬μ©νλ λ°μ λ¬Έμ κ° μμμ΅λλ€.
    - μ΄λ₯Ό ν΄κ²°νκΈ° μν΄μ μ§μ° μμ± νλ‘νΌν°λ₯Ό ν΅ν΄μ `JuiceMaker`μ μμ‘΄μ±μ μ£Όμνμ¬μ `FruitStore`λ‘ μμ±λλ μΈμ€ν΄μ€λ₯Ό `JuiceMakerViewController`κ° κ°μ§κ³  μλλ‘ κ΅¬ννμμ΅λλ€.
    - λν, μ΄λ₯Ό ν΅ν΄μ `ModifyViewController`μ λ°μ΄ν°λ₯Ό `Delegate Pattern`μΌλ‘ λμ± μ½κ² λ°μ΄ν°λ₯Ό μ λ¬ν  μ μλλ‘ νμμ΅λλ€. 
    - μΆκ°μ μΌλ‘ `Delegate`μμ μ μν νλ‘νΌν°λ₯Ό μ½κΈ° μ μ© νλ‘νΌν°λ‘ μ μ©νμ¬μ `ModifyViewController`μμ μ§μ μ μΌλ‘ μμ νλ κ²μ λ°©μ§νκ³ μ νμμ΅λλ€.
    - μμ κ°μ μν©μμ `NotificationCenter`λ₯Ό νμ©νμ¬μ `FruitStore`μ μλ λ°μ΄ν° λ³κ²½μ κ΄μ°°νλ κ²μ λ°μ΄ν° λ³κ²½μ λ°λ₯Έ λ·°μ κ°±μ λ§ ν  μ μκ² λλ κ²μ΄ μ₯μ μ΄λΌκ³  μκ°νμκ³ , μμ‘΄μ±μ μ£Όμνμμ λμλ λ°μ΄ν°μ λ³κ²½μ κ΄μ°°νμ§ μμμ λ°μ΄ν° λ·°μ κ°±μ μ μ§μ μ μΌλ‘ ν΄μ€μΌ νμ§λ§, λλ²μ§Έ νλ©΄κ³Όμ λ°μ΄ν°λ₯Ό κ³΅μ ν  μ μλ κ²μ΄ μ₯μ μ΄λΌκ³  μκ°νμμ΅λλ€.
    - μ ν¬λ μ΄μ κ°μ μν©μμ μ΄λ€ λ°©λ²μ΄ λ μ μ ν λ°©λ²μΈμ§μ λν΄μ κ³ λ―Όνκ² λμμ΅λλ€.
        ```swift
        private let store = FruitStore()
        lazy var maker = JuiceMaker(store: store)
        ```

- Delegate ν¨ν΄μ μ½κΈ° μ μ© νλ‘νΌν°
    - `segue`λ₯Ό ν΅ν΄μ λ°μ΄ν°λ₯Ό μ λ¬ν  λ,λλ²μ§Έ λ·°μ»¨νΈλ‘€λ¬μ μΈμ€ν΄μ€μ μ²«λ²μ§Έ λ·° μ»¨νΈλ‘€λ¬μ `store`μ μ¬κ³ λ λ€λ₯Έ μΈμ€ν΄μ€κ° μμ±λκΈ° λλ¬Έμ νλ©΄μ΄ `Dismiss` λκΈ° μ μ λ°μ΄ν°λ₯Ό λ€μ λκ²¨μ λ³κ²½ν΄μ€μΌ νλ λ¨μ μ΄ μμμ΅λλ€.
    - μ ν¬λ νλ©΄μ΄ μ νλ  λ λ°μ΄ν°λ₯Ό λ°μνλ κ²μ΄ μλλΌ μ¬μ©μμ μ΄λ²€νΈμ λ°λΌμ μ§μ μ μΌλ‘ λ³νλ₯Ό μ£Όκ³  μΆμμ΅λλ€. κ·Έλμ `Delegate Pattern`μ νμ©νμ¬μ λ°μ΄ν°μ λ³νλ₯Ό λ°μνκ³ , λλ²μ§Έ νλ©΄μ μ΄κΈ°κ°μ λ°μν  μ μλλ‘ μ½κΈ°μ μ© νλ‘νΌν°λ₯Ό μ μνμμ΅λλ€.
    - μ²μ μ μ©ν  λμλ λ¨μν `get`μ μ μ΄ λμμΌλκΉ μ½κΈ°μ μ©μΌλ‘ κ΅¬νμ νκ²μ΄λΌκ³  μκ°νμ¬μ μ΄μκ° λ°μνμμ΅λλ€.
    - νμ§λ§, λ©μλλ₯Ό μ μνλ κ²κ³Όλ λ¬λ¦¬, νλ‘νΌν°λ₯Ό μ μνκΈ° μν΄μλ μ½κΈ°μ μ© νλ‘νΌν°μλ μ΄λ€ κ²λ€μ΄ μκ³ , μ½κΈ°μ μ°κΈ°κ° λͺ¨λ κ°λ₯ν νλ‘νΌν°λ μ΄λ€ κ²λ€μ΄ μλμ§ μμμΌ νμ΅λλ€.
    - μ΄μ λν΄μ κ³΅λΆν κ²°κ³Ό, νλ‘ν μ½μμμ `get, set` ν€μλλ μ½κΈ° μ μ©κ³Ό μ°κΈ°κ°λ₯μ λν κ²μ μ μλ§ νλ€λ κ²μ μμκ³ , μ μ₯ νλ‘νΌν°μ μ°μ° νλ‘νΌν°μμ μ½κΈ° μ μ© νλ‘νΌν°λ₯Ό μ μνλ λ°©λ²κ³Ό μ°κΈ° κ°λ₯ νλ‘νΌν°λ₯Ό μ μνλ λ°©λ²μ΄ μλ€λ κ²μ μμμ΅λλ€.
    - μ΄λ₯Ό λ°νμΌλ‘ μ°μ° νλ‘νΌν°μμμ μ½κΈ°μ μ© νλ‘νΌν°λ₯Ό μ μ©νμ¬μ λλ²μ§Έ λ·° μ»¨νΈλ‘€λ¬μμ μ½λ κ²λ§ κ°λ₯ν λ°μ΄ν°λ₯Ό μ λ¬ν  μ μλλ‘ νμμ΅λλ€.
        ```swift
        extension JuiceMakerViewController: ModifyStockDelegate {
            var inventory: [Fruit: Int] {
                get {
                    return store.inventory
                }
            }

            func updateStock(by fruit: Fruit, to stock: Int) {
                store.inventory[fruit] = stock
                updateStockLabels()
            }
        }
        ```

## π 6. μ°Έκ³  λ§ν¬
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [μμ΄λ³΄λ₯Ό μν iOS μ±κ°λ°](https://yagom.net/courses/ios-starter-uikit/)
