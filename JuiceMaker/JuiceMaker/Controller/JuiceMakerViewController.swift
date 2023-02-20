//
//  JuiceMakerViewController - JuiceMakerViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private let maker = JuiceMaker()
    @IBOutlet private var fruitLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ModifyViewController.identifier {
            guard let nabViewController = segue.destination as? UINavigationController,
                  let controller = nabViewController.viewControllers.first as? ModifyViewController else {
                return
            }
            controller.delegate = self
        }
    }
}

// Delegate 관련 메서드
extension JuiceMakerViewController: ModifyStockDelegate {
    func modifyViewController(
        with viewController: ModifyViewController,
        stockOf fruit: Fruit
    ) -> Int? {
        return maker.readStock(fruit)
    }
    
    func modifyViewController(
        with viewController: ModifyViewController,
        by fruit: Fruit,
        to stock: Int
    ) {
        maker.changeStock(fruit, stock)
        updateStockLabels()
    }
}

// 버튼 관련 메서드
private extension JuiceMakerViewController {
    @IBAction func didTapJuiceButton(_ sender: UIButton) {
        guard let orderedJuice = Juice(rawValue: sender.tag) else { return }
        
        let result = maker.makeJuice(juice: orderedJuice)
        showAlertControllerBased(on: result, of: orderedJuice)
    }
}

// 화면 이동 관련 메서드
private extension JuiceMakerViewController {
    @IBAction func didTapEditButton(_ sender: UIButton) {
        presentModifyController()
    }
    
    func presentModifyController() {
        self.performSegue(withIdentifier: ModifyViewController.identifier, sender: nil)
    }
}

// UI 관련 메서드
private extension JuiceMakerViewController {
    func updateStockLabels() {
        fruitLabels.indices.forEach(setStockLabel)
    }
    
    func setStockLabel(index: Int) {
        if let fruit = Fruit(rawValue: index),
           let stock = maker.readStock(fruit) {
            fruitLabels[index].text = stock.description
        }
    }
    
    func showAlertControllerBased(on isSuccess: Bool, of juice: Juice) {
        updateStockLabels()
        
        if isSuccess == true {
            let alert = JuiceAlertDirector().makeSuccessAlert(juice: juice)
            present(alert, animated: true)
        }
        
        if isSuccess == false {
            let alert = JuiceAlertDirector().makeFailureAlert(juice: juice) { _ in
                self.presentModifyController()
            }
            
            present(alert, animated: true)
        }
    }
}
