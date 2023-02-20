//
//  Fruit.swift
//  Created by Ash, 미니.
//

enum Fruit: Int, CaseIterable {
    static let baseStock: Int = 10
    
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static var beginningStock: [Fruit: Int] {
        return self.allCases.reduce(into: [:]) { $0[$1] = baseStock }
    }
}
