//
//  UserRouter.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol UserRouterProtocol {
  var viewController: UserViewController? { get }

  func navigateToArtist(view:UIViewController,atIndexPath indexPath: IndexPath, animated: Bool)

}

class UserRouter{
  
  weak var viewController:UserViewController?
  init(viewController:UserViewController) {
    
    self.viewController = viewController
  }
  

}
extension UserRouter: UserRouterProtocol {
  func navigateToArtist(view:UIViewController,atIndexPath indexPath: IndexPath, animated: Bool) {
      
    viewController?.navigationController?.pushViewController(view, animated: true)
  }
  




}



//import UIKit
//
//protocol CandyRouterProtocol {
//
//}
//
///// Candy Module Router (aka: Wireframe)
//class CandyRouter: CandyRouterProtocol {
//
//}
