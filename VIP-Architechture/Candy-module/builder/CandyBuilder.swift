//
//  CandyBuilder.swift
//  VIP-Architechture
//
//  Created by Apple on 4/2/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
class CandyBuilder {

  class func buildModule(arroundView view: CandyViewProtocol) {

    let presenter = CandyPresenter()
    let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
    let router = CandyRouter()
    

   //MARK: link VIP components.
    view.presenter = presenter
    view.interactor = interactor
    view.wireframe = router
    presenter.view = view
    interactor.presenter = presenter
    
    
  }

  
}
