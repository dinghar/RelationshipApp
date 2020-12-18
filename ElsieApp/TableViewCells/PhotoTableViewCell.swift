//
//  PhotoTableViewCell.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/17/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(for image: UIImage?) {
        selectionStyle = .none
        activityIndicator.startAnimating()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.image = image ?? UIImage()
        photo.sizeToFit()
    }
    
}
