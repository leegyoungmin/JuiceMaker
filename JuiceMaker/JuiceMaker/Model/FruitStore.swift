//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

// 과일 저장소 타입
class FruitStore {
    private var inventory: [Fruit: Int] = Fruit.beginningStock
    
    func haveStock(for juice: Juice) -> Bool {
        return juice.needFruitAndStock.allSatisfy(checkStockAndChangeStock)
    }
    
    func changeStock(with fruit: Fruit, amount: Int) {
        guard let remainAmount = inventory[fruit] else {
            return
        }
        
        inventory.updateValue(remainAmount - abs(amount), forKey: fruit)
    }
    
    func sendStock(to fruit: Fruit) -> Int? {
        return inventory[fruit]
    }
    
    private func checkStockAndChangeStock(with fruit: Fruit, amount: Int) -> Bool {
        guard let remainAmount = inventory[fruit],
              remainAmount >= abs(amount) else {
            return false
        }
        changeStock(with: fruit, amount: amount)
        return true
    }
}
