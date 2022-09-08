//
//  JuiceMakerViewController - JuiceMakerViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let fruitStore = FruitStore()
    lazy var maker = JuiceMaker(fruitStore: fruitStore)
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
        fruitStore.delegate = self
        setUpStockLabels(changedStocks: fruitStore.inventory)
	}
	
	private func setUpStockLabels(changedStocks: [Fruit: Int]) {
		[
			strawberryStockLabel,
			bananaStockLabel,
			pineAppleStockLabel,
			kiwiStockLabel,
			mangoStockLabel,
		].compactMap { $0 }.forEach {
			if let fruit = Fruit(rawValue: $0.tag),
			   let stock = changedStocks[fruit]?.description {
				$0.text = stock
			}
		}
	}
	
	@IBAction func didTapJuiceButton(_ sender: UIButton) {
		guard let orderedJuice = Juice(rawValue: sender.tag) else {
			return
		}
		let result = maker.makeJuice(juice: orderedJuice)
        showAlertControllerBased(on: result, of: orderedJuice)
	}
	
	private func showAlertControllerBased(on isMaked: Bool, of juice: Juice) {
		let titleMessage = isMaked ? AlertMessages.successTitle : AlertMessages.failureTitle
		let message = isMaked ? "\(juice.description) \(AlertMessages.successMessage)" : AlertMessages.failureMessage
		let confirmMessage = isMaked ? AlertMessages.successConfirmMessage : AlertMessages.failureConfirmMessage
		let alertController = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: confirmMessage, style: .default) { _ in
			if !isMaked {
				self.performSegue(withIdentifier: ModifyViewController.identifier, sender: nil)
			}
		}
		
		if isMaked {
			alertController.addAction(okAction)
		} else {
			let cancelAction = UIAlertAction(title: AlertMessages.failureCancelMessage, style: .default)
			alertController.addAction(cancelAction)
			alertController.addAction(okAction)
		}
		
		present(alertController, animated: true)
	}
}

extension JuiceMakerViewController: fruitable {
    func changeStocks(_ inventory: [Fruit : Int]) {
        setUpStockLabels(changedStocks: inventory)
    }
}
