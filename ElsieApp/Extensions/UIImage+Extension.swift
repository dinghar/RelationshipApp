//
//  UIImage+Extension.swift
//  ElsieApp
//
//  Created by Ross Harding on 2/19/20.
//  Copyright © 2020 Harding LLC. All rights reserved.
//

import UIKit

extension UIImage {
    
    func getImageRatio() -> CGFloat {
        if self.size.width > 1 && self.size.height > 1 {
            return CGFloat(self.size.width / self.size.height)
        }
        return 1
    }
}
