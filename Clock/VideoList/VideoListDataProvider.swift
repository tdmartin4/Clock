//
//  VideoListDataProvider.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation


protocol VideoListDataProviderDelegate: class {
    func videoListDidUpdate()
    func videoListDidFailToUpdate(error: VideoListDataProviderError)
}

protocol VideoListDataProvider: class {
    var videos: [Video] { get }
    var delegate: VideoListDataProviderDelegate? { get set }
    func requestNextPage()
}

enum VideoListDataProviderError: Error {
    case noInternetConnection
}
