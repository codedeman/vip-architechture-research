//
//  CandyApiWorker.swift
//  VIP-Architechture
//
//  Created by Apple on 4/1/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
protocol CandyAPIWorkerProtocol {
    func fetchCandy(callBack:(CandyEntity) -> Void)
}

class CandyAPIWorker: CandyAPIWorkerProtocol {
  func fetchCandy(callBack: (CandyEntity) -> Void) {
    let candyEntity = CandyEntity(title: "Magic Candy",
    description: "Magic candies coming from heaven, if you eat one and say a wish. Your wish will be granted.",
    price: 100,
    imageName: "girl.jpg")
    callBack(candyEntity)
  }
  
  
  
}
