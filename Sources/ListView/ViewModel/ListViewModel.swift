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
            let labelColor = self.getLabelColor(percent: value.changePercent)
            print("Model Value: \(value) at index: \(indexPath-1)")
            let color = ListLabelColor(rankColor: .lightText, nameColor: .white, percentColor: labelColor, priceColor: labelColor)
            
            return (value, color)
        } else {
            return (emptyLabel, defaultLabelColor)
        }
    }
    
    private func getLabelColor(percent: String) -> UIColor {
        guard let doubleValue = Double(percent) else {
            return .green
        }
        
        switch doubleValue.sign {
        case .minus:
            return .red
        case .plus:
            return .green
        }
    }
}
