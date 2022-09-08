//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

import Foundation

protocol fruitable {
    func changeStocks(_ inventory: [Fruit: Int])
}

// 과일 저장소 타입
class FruitStore {
    var delegate: fruitable?
	var inventory: [Fruit: Int] = Fruit.beginningStock {
		didSet {
            delegate?.changeStocks(inventory)
		}
	}
    
	
	func haveStock(for juice: Juice) throws {
		let needFruitAndStock = juice.needFruitAndStock
		
		for (fruit, stock) in needFruitAndStock {
			guard let remainingStock = inventory[fruit],
				  remainingStock >= -stock else {
				throw StoreError.outOfStock
			}
		}
		changeStock(fruitAndStock: needFruitAndStock)
	}
	
	private func changeStock(fruitAndStock: [Fruit: Int]) {
		for (fruit, stock) in fruitAndStock {
			if let remainingStock = inventory[fruit] {
				inventory.updateValue(remainingStock + stock, forKey: fruit)
			}
		}
	}
}
