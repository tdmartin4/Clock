//
//  MockVideoListDataProvider.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation

class MockVideoListDataProvider: VideoListDataProvider {
    private var currentPage = 0
    private(set) var videos: [Video] = []
    weak var delegate: VideoListDataProviderDelegate?
    
    func requestNextPage() {
        switch currentPage {
        case 0: updateForVideosInFileAfterDelay("mock_video_payload_0")
        // case 1: updateForVideosInFileAfterDelay("mock_vidoe_payload_1")
        default: delegate?.videoListDidFailToUpdate(error: .noInternetConnection)
        }
        
        currentPage += 1
    }
    
    private func updateForVideosInFileAfterDelay(_ filename: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.videos.append(contentsOf: self.parseVideosFromJSON(filename))
            self.delegate?.videoListDidUpdate()
        }
    }
    
    private func parseVideosFromJSON(_ filename: String) -> [Video] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("File with name \(filename) could not be found")
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Video].self, from: data)
        } catch {
            fatalError("Unable to read file \(filename).json with error: \(error.localizedDescription)")
        }
    }
}
