//
//  UserViewController.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Alamofire
protocol UserViewProtocol:class {
  var presenter: UserPresenterProtocol? { get set }
  var interactor: UserInteractorProtocol? { get set }
  var wireframe: UserRouter? { get set }
  func set(viewModel: [UserEntity])

}

extension UserViewController:UserViewProtocol{
  func set(viewModel: [UserEntity]) {
    
    DispatchQueue.main.async {
      self.userEntity = viewModel
      self.userTableView.reloadData()
      
    }
  }
  

}



class UserViewController: UIViewController {

  var presenter:UserPresenterProtocol?
  var interactor: UserInteractorProtocol?
  var wireframe: UserRouter?
  var userEntity:[UserEntity] = []
  @IBOutlet weak var userTableView: UITableView!
  override func viewDidLoad() {
        super.viewDidLoad()
    interactor?.fetchUser("kevin")
    userTableView.delegate = self 
    userTableView.dataSource = self
    userTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }


}
// MARK: - UITableViewDelegate

extension UserViewController:UITableViewDataSource{
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
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let candyView = CandyView(nibName: "CandyView", bundle: nil)
      CandyBuilder.buildModule(arroundView: candyView)

    wireframe?.navigateToArtist(view: candyView, atIndexPath: indexPath, animated: true)
  }
  
  
  
}

extension UserViewController:UITableViewDelegate{

}

// MARK: -Extending UserViewController



