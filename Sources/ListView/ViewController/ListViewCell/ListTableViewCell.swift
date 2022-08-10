//
//  ListTableViewCell.swift
//  
//
//  Created by Atul Prakash on 07/08/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(labelColor: ListLabelColor, data: ListModel) {
        // Set text color
        rankLabel.textColor = labelColor.rankColor
        nameLabel.textColor = labelColor.nameColor
        changeLabel.textColor = labelColor.percentColor
        priceLabel.textColor = labelColor.priceColor
        
        // set data
        rankLabel.text = data.rank
        nameLabel.text = data.name
        changeLabel.text = data.changePercent
        priceLabel.text = data.price
    }
    
}
