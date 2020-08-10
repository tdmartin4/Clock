//
//  Video.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation

struct Video: Codable {
    let uuid: String
    let commentCount: Int
    let description: String
    let likeCount: Int
    let song: SongSummary
    let url: URL
    let user: UserSummary
}
