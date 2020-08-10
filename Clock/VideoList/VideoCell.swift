//
//  VideoCell.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit
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

class VideoCell: UICollectionViewCell {
    static let reuseIdentifier = "video_cell"
    
    let playerController = LoopingAVPlayerViewController()
    
    // Views
    private let userLabel = UILabel()
    private let titleLabel = UILabel()
    private let songLabel = UILabel()
    
    func configure(video: Video) {
        setupIfNeeded()
        userLabel.text = video.user.username
        titleLabel.text = video.description
        songLabel.text = video.song.name
        playerController.setPlayerItem(AVPlayerItem(url: video.url))
        // TODO: Add image view that shows the first frame
    }
    
    private func setupIfNeeded() {
        guard songLabel.superview == nil else { return }
        contentView.layer.masksToBounds = true
        
        playerController.videoGravity = .resizeAspectFill
        playerController.showsPlaybackControls = false
        contentView.addSubview(playerController.view)
        playerController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        songLabel.textColor = .white
        contentView.addSubview(songLabel)
        songLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottomMargin.equalToSuperview()
        }
        
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(songLabel)
            make.bottom.equalTo(songLabel.snp.top)
        }
        
        userLabel.textColor = .white
        contentView.addSubview(userLabel)
        userLabel.snp.makeConstraints { make in
            make.leading.equalTo(songLabel)
            make.bottom.equalTo(titleLabel.snp.top)
        }
    }
}
