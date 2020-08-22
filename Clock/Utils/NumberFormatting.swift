//
//  NumberFormatting.swift
//  Clock
//
//  Created by Tommy Martin on 8/14/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation

extension Int {
    var formatted: String {
        if self < 1000 {
            return "\(self)"
        } else if self < 1000000 {
            return "\(Double(Int(Double(self) / 100)) / 10)K"
        } else {
            return "\(Double(Int(Double(self) / 100000)) / 10)M"
        }
    }
}
