//
//  UserBuilder.swift
//  VIP-Architechture
//
//  Created by Apple on 4/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


class UserBuilder {
  
  class func  buildModule(arroundView view:UserViewProtocol) {
    
    let presenter = UserPresenter()
    let interactor = UserInteractor(withApiWorker: UserAPIWorker())
    let router = UserRouter()
    //MARK: link VIP components
    view.presenter = presenter
    view.interactor = interactor
    view.wireframe = router
    presenter.view = view
    interactor.presenter = presenter
    
    
  }
}
//class CandyBuilder {
//
//  class func buildModule(arroundView view: CandyViewProtocol) {
//
//    let presenter = CandyPresenter()
//    let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
//    let router = CandyRouter()
//
//
//   //MARK: link VIP components.
//    view.presenter = presenter
//    view.interactor = interactor
//    view.wireframe = router
//    presenter.view = view
//    interactor.presenter = presenter
//
//
//  }
//
//
//}
