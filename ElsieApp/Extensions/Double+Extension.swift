//
//  Double+Extension.swift
//  ElsieApp
//
//  Created by Ross Harding on 12/17/20.
//  Copyright © 2020 Harding LLC. All rights reserved.
//

import Foundation


extension Double {
    
    func format(with unit: String) -> String {
        return "\(String(format: "%.0f", self)) \(unit)\(self != 1 ? "s" : "") "
    }
}
