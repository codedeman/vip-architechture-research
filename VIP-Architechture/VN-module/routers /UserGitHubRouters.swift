//
//  UserGitHubRouters.swift
//  VIP-Architechture
//
//  Created by Apple on 4/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


protocol UserGitHubRouting:class {
  
  static func createdUserListModule(arroundView view:UserGitHubViewProtocol)
}

final class UserGitHubRouter{

}

extension UserGitHubRouter:UserGitHubRouting{
  static func createdUserListModule(arroundView view: UserGitHubViewProtocol) {
    let interactor = UserGitHubInteractor(withApiWorker: UserGitHubWorker())
    let router = UserGitHubRouter()
    //MARK: link VIP components.
    
    view.interactor = interactor
    view.router = router
    interactor.view = view
    interactor.router = router

  }
  
  


}
