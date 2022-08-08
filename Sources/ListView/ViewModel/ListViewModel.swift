//
//  ListViewModel.swift
//  
//
//  Created by Atul Prakash on 07/08/22.
//

import Foundation
import UIKit

class ListViewModel {
    var tableData: [ListModel]?
    var headerData: ListModel?
    let emptyLabel = ListModel(rank: "", name: "", changePercent: "", price: "")
    let defaultLabelColor = ListLabelColor(rankColor: .lightText, nameColor: .lightText, percentColor: .lightText, priceColor: .lightText)
    
    func getNumberOfRows() -> Int {
        if let tableData = tableData {
            return tableData.count + 1
        } else {
            return 0
        }
    }
    
    func itemAtIndexPath(indexPath: Int) -> (data: ListModel, color: ListLabelColor) {
        if indexPath == 0 {
            return getFirstIndexData()
        } else {
            return getCellData(indexPath: indexPath)
        }
    }
    
    private func getFirstIndexData() -> (ListModel, ListLabelColor) {
        // if header data is passed from the host app
        if let headerData = headerData {
            return(headerData, defaultLabelColor)
        }
        let headerValue = ListModel(rank: "#", name: "Name", changePercent: "24h", price: "Price")
        return(headerValue, defaultLabelColor)
    }
    
    private func getCellData(indexPath: Int) -> (ListModel, ListLabelColor) {
        if let tableData = tableData {
            let value = tableData[indexPath - 1]
            let priceChange = self.getPriceAndColor(percent: value.changePercent)
            let price = Double(value.price)?.rounded(toPlaces: 2) ?? 0.0
            
            let model = ListModel(rank: value.rank, name: value.name, changePercent: priceChange.percent, price: String(price))
            let color = ListLabelColor(rankColor: .lightText, nameColor: .white, percentColor: priceChange.color, priceColor: priceChange.color)
            
            return (model, color)
        } else {
            return (emptyLabel, defaultLabelColor)
        }
    }
    
    private func getPriceAndColor(percent: String) -> (percent: String, color: UIColor) {
        let doubleValue = Double(percent)
        guard let roundedValue = doubleValue?.rounded(toPlaces: 2) else {
            return ("", .green)
        }
        
        switch roundedValue.sign {
        case .minus:
            return (String(roundedValue), .red)
        case .plus:
            return (String(roundedValue), .green)
        }
    }
}
