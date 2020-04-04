//
//  UserEntity.swift
//  VIP-Architechture
//
//  Created by Apple on 4/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


struct UserRequest:Codable{
    let total_count:Int = 0
    let incomplete_results:Bool
    let items:[UserEntity]
}

struct UserEntity:Codable{
    let login:String
    let id:Int
    let node_id:String
    let avatar_url:String
}
