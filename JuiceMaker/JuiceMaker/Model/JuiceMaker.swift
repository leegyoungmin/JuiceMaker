//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> Bool {
        return fruitStore.haveStock(for: juice)
    }
    
    func readStock(_ fruit: Fruit) -> Int? {
        return fruitStore.sendStock(to: fruit)
    }
    
    func updateStock(_ fruit: Fruit, _ stock: Int) {
        fruitStore.changeStock(with: fruit, amount: stock)
    }
}
