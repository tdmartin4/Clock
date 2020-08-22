//
//  Icons.swift
//  Clock
//
//  Created by Tommy Martin on 8/13/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

extension UIImage {
    private static func systemImage(name: String) -> UIImage {
        guard let image = UIImage(systemName: name) else {
            fatalError("There is no system image with name \(name)")
        }
        
        return image
    }
    
    static var home: UIImage {
        return systemImage(name: "house.fill")
    }
    
    static var discover: UIImage {
        return systemImage(name: "magnifyingglass")
    }
    
    static var inbox: UIImage {
        return systemImage(name: "tray.and.arrow.down.fill")
    }
    
    static var profile: UIImage {
        return systemImage(name: "person.fill")
    }
    
    static var plus: UIImage {
        return systemImage(name: "plus")
    }
}
