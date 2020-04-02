//
//  CandyView.swift
//  VipDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module View Protocol
protocol CandyViewProtocol: class {
    var presenter: CandyPresenterProtocol? { get set }
    var interactor: CandyInteractorProtocol? { get set }
    var wireframe: CandyRouterProtocol? { get set }

    // Update UI with value returned.
    /// Set the view Object of Type CandyEntity
    func set(viewModel: CandyViewModel)
    /// Set the view price object
//    func set(totalPriceViewModel viewModel: TotalPriceViewModel)
}

/// Candy Module View
class CandyView: UIViewController {
    
    var presenter: CandyPresenterProtocol?
    var interactor: CandyInteractorProtocol?
    var wireframe: CandyRouterProtocol?
    
    @IBOutlet weak private var candyImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var quantityStepper: UIStepper!
    @IBOutlet weak private var quantityLabel: UILabel!
    
    @IBOutlet weak private var totalPriceLabel: UILabel!
    @IBOutlet weak private var taxLabel: UILabel!
    @IBOutlet weak private var inclTaxLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      print("loading ...")

        // Informs the interactor that the View is ready to receive data.
        interactor?.fetchCandy()
    }
    
    @IBAction func quantityStepperValueChanged(_ sender: Any) {
//        interactor?.update(candyQuantity: Int(quantityStepper!.value))
    }
}

// MARK: - extending CandyView to implement it's protocol
extension CandyView: CandyViewProtocol {
    
    func set(viewModel: CandyViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        candyImageView.image = UIImage(named: viewModel.imageName)
    }
    


}
