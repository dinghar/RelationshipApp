//
//  QuoteTableViewCell.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/17/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with quote: String) {
        quoteLabel.text = "\"\(quote)\""
        background.layer.cornerRadius = 5
        background.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        selectionStyle = .none
    }
}
