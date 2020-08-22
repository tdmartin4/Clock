//
//  User.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation

struct UserSummary: Codable {
    let uuid: String
    let imageURL: URL
    let username: String
}
