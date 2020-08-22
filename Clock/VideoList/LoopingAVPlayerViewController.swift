//
//  LoopingAVPlayerViewController.swift
//  Clock
//
//  Created by Tommy Martin on 8/9/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation
import AVKit

class LoopingAVPlayerViewController: AVPlayerViewController {
    private var looper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer {
        guard let player = player as? AVQueuePlayer else {
            fatalError("Should initialize with AVPlayer")
        }
        
        return player
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        player = AVQueuePlayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlayerItem(_ playerItem: AVPlayerItem) {
        queuePlayer.replaceCurrentItem(with: playerItem)
        looper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
    }
    
    func stopPlaying() {
        queuePlayer.pause()
    }
}
