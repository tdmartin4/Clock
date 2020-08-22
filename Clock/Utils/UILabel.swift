//
//  UILabel.swift
//  Clock
//
//  Created by Tommy Martin on 8/14/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont, textColor: UIColor) {
        self.init()
        self.font = font
        self.textColor = textColor
    }
}
