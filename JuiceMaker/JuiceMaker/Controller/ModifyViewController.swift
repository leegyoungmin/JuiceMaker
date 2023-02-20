//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

protocol ModifyStockDelegate: AnyObject {
    func modifyViewController(with viewController: ModifyViewController, stockOf fruit: Fruit) -> Int?
    func modifyViewController(with viewController: ModifyViewController, by fruit: Fruit, to stock: Int)
}

final class ModifyViewController: UIViewController {
    static let identifier = String(describing: ModifyViewController.self)
    weak var delegate: ModifyStockDelegate?
    
    @IBOutlet private var fruitLabels: [UILabel]!
    @IBOutlet private var stockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNavBackgroundColor()
        setUpStocks()
    }
}

// UI 관련 메서드
private extension ModifyViewController {
    func changeNavBackgroundColor() {
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
    
    func setUpStocks() {
        fruitLabels.indices.forEach {
            if let fruit = Fruit(rawValue: $0),
               let stock = delegate?.modifyViewController(with: self, stockOf: fruit) {
                fruitLabels[$0].text = stock.description
                stockSteppers[$0].value = Double(stock)
            }
        }
    }
}

// 버튼 관련 메서드
private extension ModifyViewController {
    @IBAction func didTappedStepper(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            delegate?.modifyViewController(with: self, by: fruit, to: Int(sender.value))
            setUpStocks()
        }
    }
}

// 화면 이동 관련 메서드
private extension ModifyViewController {
    @IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
