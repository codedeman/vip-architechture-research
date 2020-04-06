//
//  UserGitHubWorker.swift
//  VIP-Architechture
//
//  Created by Apple on 4/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

protocol UserGitHubWorkerProtocol {
  func fetchUser(username:String,callBack:@escaping(UserRequest?)->Void)
}
 class UserGitHubWorker:UserGitHubWorkerProtocol{
  func fetchUser(username: String, callBack: @escaping (UserRequest?) -> Void) {
    Alamofire.request(ApiBaseURl+username).responseJSON { (response) in
       
       if let error = response.error{
         debugPrint(error.localizedDescription)
         callBack(nil)
       }
       
       guard let data = response.data else {return callBack(nil)}
       let jsonDecoder = JSONDecoder()
       
       do {
         let person = try jsonDecoder.decode(UserRequest.self, from: data)
         callBack(person)
       } catch {
         debugPrint(error.localizedDescription)
         callBack(nil)
       }
       
     }
  }
  
  

}
 
