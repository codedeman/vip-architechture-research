//
//  GitHubUserInteractor.swift
//  VIP-Architechture
//
//  Created by Apple on 4/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire


protocol UserGitHubInteractorProtocol {
  var router:UserGitHubRouting? { get set }
  func fetchUser(_ username:String)
}

class UserGitHubInteractor: UserGitHubInteractorProtocol {
  var router: UserGitHubRouting?
  private var apiWorker:UserGitHubWorkerProtocol?
  weak var view: UserGitHubViewProtocol?
  required init(withApiWorker apiWorker:UserGitHubWorkerProtocol){
    self.apiWorker = apiWorker
  }
  func fetchUser(_ username: String) {
    apiWorker?.fetchUser(username: username, callBack: { (userEntity) in
      self.view?.set(viewModel: userEntity!.items)
    })

  }
  
  
}










