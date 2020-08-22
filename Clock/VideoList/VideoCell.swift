//
//  VideoCell.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit
import AVKit
import MarqueeLabel

class VideoCell: UICollectionViewCell {
    static let reuseIdentifier = "video_cell"
    
    let playerController = LoopingAVPlayerViewController()
    
    // Views
    private let userLabel = UILabel(font: .body, textColor: .onVideo)
    private let descriptionLabel = UILabel(font: .body, textColor: .onVideo)
    let songLabel = MarqueeLabel(frame: .zero, rate: 60, fadeLength: 0)
    
    private let buttonStackView = UIStackView()
    private let userButton = UserImageView()
    private let likesButton = VideoButton(image: .like)
    private let commentsButton = VideoButton(image: .comment)
    private let shareButton = VideoButton(image: .share, title: "Share")
    private let songButton = URLImageView()
    
    // Constants
    private let padding: CGFloat = 10
    private let buttonSpacing: CGFloat = 20
    private let descriptionSpacing: CGFloat = 10
    private let descriptionTrailing: CGFloat = 20
    private let buttonWidth: CGFloat = 40
    private let buttonHeight: CGFloat = 60
    
    func configure(video: Video) {
        setupIfNeeded()
        userLabel.text = "@\(video.user.username)"
        descriptionLabel.text = video.description
        songLabel.text = "\(video.song.name) - @\(video.song.artist.name)     "
        playerController.setPlayerItem(AVPlayerItem(url: video.url))
        
        userButton.url = video.user.imageURL
        songButton.url = video.song.artist.imageURL
        likesButton.title = "\(video.likeCount.formatted)"
        commentsButton.title = "\(video.commentCount.formatted)"
    }
    
    private func setupIfNeeded() {
        guard songLabel.superview == nil else { return }
        contentView.layer.masksToBounds = true
        
        setupVideo()
        setupButtons()
        setupVideoDescription()
    }
    
    private func setupVideo() {
        playerController.videoGravity = .resizeAspectFill
        playerController.showsPlaybackControls = false
        contentView.addSubview(playerController.view)
        playerController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
        
    private func setupButtons() {
        userButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(60)
        }
        
        songButton.layer.cornerRadius = 25
        songButton.layer.masksToBounds = true
        songButton.contentMode = .scaleAspectFill
        songButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = buttonSpacing
        buttonStackView.addArrangedSubview(userButton)
        addVideoButtonToStackView(likesButton)
        addVideoButtonToStackView(commentsButton)
        addVideoButtonToStackView(shareButton)
        buttonStackView.addArrangedSubview(songButton)
        contentView.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-padding)
        }
    }
    
    private func addVideoButtonToStackView(_ button: VideoButton) {
        let containerView = UIView()
        containerView.addSubview(button)
        buttonStackView.addArrangedSubview(containerView)
        button.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
            make.top.bottom.centerX.equalToSuperview()
        }
    }
        
    private func setupVideoDescription() {
        let musicImageView = UIImageView(image: .musicNote)
        musicImageView.tintColor = .onVideo
        contentView.addSubview(musicImageView)
        musicImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.height.width.equalTo(15)
            make.bottomMargin.equalToSuperview().offset(-padding)
        }
        
        songLabel.font = .body
        songLabel.textColor = .onVideo
        contentView.addSubview(songLabel)
        songLabel.snp.makeConstraints { make in
            make.centerY.equalTo(musicImageView)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.leading.equalTo(musicImageView.snp.trailing).offset(4)
        }
        
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(musicImageView)
            make.bottom.equalTo(songLabel.snp.top).offset(-descriptionSpacing)
            make.trailing.equalTo(buttonStackView.snp.leading).offset(-descriptionTrailing)
        }
        
        contentView.addSubview(userLabel)
        userLabel.snp.makeConstraints { make in
            make.leading.equalTo(musicImageView)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-descriptionSpacing)
            make.trailing.equalTo(buttonStackView.snp.leading).offset(-descriptionTrailing)
        }
    }
}
