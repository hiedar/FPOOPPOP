//
//  CustomCellTableViewCell.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func fillWith(card: Card) {
        rankLabel.textColor = card.suit.color
        rankLabel.text = card.rank.description
        suitLabel.text = card.suit.description
    }
}
