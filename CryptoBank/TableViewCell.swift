//
//  TableViewCell.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var up: UIImageView!
    @IBOutlet weak var down: UIImageView!
    
    @IBOutlet weak var CurrencyTitle: UILabel!
    
    @IBOutlet weak var priceUSD: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    
    @IBOutlet weak var change24H: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
