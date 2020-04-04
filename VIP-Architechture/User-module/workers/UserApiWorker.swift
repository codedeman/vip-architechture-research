//
//  UserApiWorker.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON
protocol UserAPIWorkerProtocol {
  func fetchUser(username:String,callBack:@escaping(UserRequest?)->Void)
}

class UserAPIWorker: UserAPIWorkerProtocol {
  
  
  func fetchUser(username: String, callBack:@escaping (UserRequest?) -> Void) {
    
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

//protocol CandyAPIWorkerProtocol {
//    func fetchCandy(callBack:(CandyEntity) -> Void)
//}


