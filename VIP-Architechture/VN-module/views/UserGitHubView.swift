//
//  UserGitHubView.swift
//  VIP-Architechture
//
//  Created by Apple on 4/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Alamofire

protocol UserGitHubViewProtocol:class {
  var interactor: UserGitHubInteractorProtocol? { get set }
  var router:UserGitHubRouter?{get set}
  func set(viewModel:[UserEntity])
}

class UserGitHubView: UIViewController {
  var interactor: UserGitHubInteractorProtocol?
  var router:UserGitHubRouter? 
  @IBOutlet weak var userTableView: UITableView!
  private var userEntity:[UserEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
      interactor?.fetchUser("kevin")
      userTableView.delegate = self
      userTableView.dataSource = self
      userTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
      
    }


}


//MARK:-UITableViewDelegate

extension UserGitHubView:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userEntity.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? UITableViewCell else {
      return UITableViewCell()
    }
    
    let item = userEntity[indexPath.row]
    Alamofire.request(item.avatar_url).responseData { (response) in
      if response.error == nil{
        if response.data != nil
        {
          DispatchQueue.main.async {
            cell.imageView?.image = UIImage(data: response.data!)
            cell.textLabel?.text = item.login
          }
        }
      }
    }
    
    return cell
  }
  
}

//MARK UITableVIewDelegate
extension UserGitHubView:UITableViewDelegate{

}
//MARK Extending UserGitHubViewProtocol

extension UserGitHubView:UserGitHubViewProtocol
{
  func set(viewModel: [UserEntity]) {
     DispatchQueue.main.async {
          self.userEntity = viewModel
          self.userTableView.reloadData()
      }
  }
  

}
