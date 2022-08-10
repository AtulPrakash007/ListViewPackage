//
//  ListModel.swift
//  
//
//  Created by Atul Prakash on 07/08/22.
//

import Foundation
import UIKit

public struct ListModel {
    let rank: String
    let name: String
    let changePercent: String
    let price: String
    
    public init(rank: String, name: String, changePercent: String, price: String) {
        self.rank = rank
        self.name = name
        self.changePercent = changePercent
        self.price = price
    }
}

public struct ListLabelColor {
    let rankColor: UIColor
    let nameColor: UIColor
    let percentColor: UIColor
    let priceColor: UIColor
}
