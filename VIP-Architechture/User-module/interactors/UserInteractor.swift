//
//  UserInteractor.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

let ApiBaseURl = "https://api.github.com/search/users?q="

protocol UserInteractorProtocol {
  
  func fetchUser(username:String)
}

class UserInteractor: UserInteractorProtocol {
  private var userEntity:UserEntity?
  private var apiWorker:UserAPIWorkerProtocol?
  var presenter:UserPresenterProtocol?
  
  required init(withApiWorker apiWorker:UserAPIWorkerProtocol){
    self.apiWorker = apiWorker
  }
  

  func fetchUser(username: String) {
    apiWorker?.fetchUser(username: username, callBack: { (userEnity) in
      self.presenter?.interactor(self, didFetch: userEnity!.items)
    })
  }
  
  
  
}


