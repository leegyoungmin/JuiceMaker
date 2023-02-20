//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

// 과일 저장소 타입
class FruitStore {
    private var inventory: [Fruit: Int] = Fruit.beginningStock
    
    func haveStock(for juice: Juice) -> Bool {
        return juice.needFruitAndStock.allSatisfy(checkStock)
    }
    
    private func checkStock(with fruit: Fruit, amount: Int) -> Bool {
        guard let remainAmount = inventory[fruit],
              remainAmount >= abs(amount) else {
            return false
        }
        
        return true
    }
    
    private func changeStock(fruitAndStock: [Fruit: Int]) {
        for (fruit, stock) in fruitAndStock {
            if let remainingStock = inventory[fruit] {
                updateInventory(fruit, remainingStock + stock)
            }
        }
    }
    
    func sendStock(to fruit: Fruit) -> Int? {
        return inventory[fruit]
    }
    
    func updateInventory(_ fruit: Fruit, _ stock: Int) {
        inventory.updateValue(stock, forKey: fruit)
    }
}
