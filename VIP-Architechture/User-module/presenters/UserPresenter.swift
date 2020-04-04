//
//  UserPresenter.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

protocol UserPresenterProtocol:class {
  func interactor(_ interactor:UserInteractorProtocol,didFetch object:[UserEntity])
  func interactor(_ interactor: UserInteractorProtocol, didFailWith error: Error)
  

}

class UserPresenter {
    weak var view: UserViewProtocol?
    var interactor: UserInteractorProtocol?
}



extension UserPresenter: UserPresenterProtocol {
 
  func interactor(_ interactor: UserInteractorProtocol, didFetch object: [UserEntity]) {
    
    view?.set(viewModel: object)
    

//    let userViewModel = UserViewModel(login: object.login, avatar_url: object.avatar_url, score: object.score)
//    view?.set(viewModel: userViewModel)
    
  }
  
  func interactor(_ interactor: UserInteractorProtocol, didFailWith error: Error) {
     
   }
  
  
  
}

