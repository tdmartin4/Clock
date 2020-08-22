//
//  UserView.swift
//  Clock
//
//  Created by Tommy Martin on 8/15/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

class URLImageView: UIImageView {
    private weak var dataTask: URLSessionDataTask?
    var url: URL? {
        didSet {
            image = nil
            loadNewURL()
        }
    }
    
    private func loadNewURL() {
        dataTask?.cancel() // Cancel any previous data task
        guard let url = url else {
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }

        dataTask?.resume()
    }
}

class UserImageView: UIView {
    private let containerView = UIView()
    private let imageView = URLImageView()
    var url: URL? {
        didSet {
            imageView.url = url
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        containerView.backgroundColor = .white
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(containerView.snp.width)
        }
        
        imageView.contentMode = .scaleAspectFill
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview().multipliedBy(0.9)
        }
        
        let plusView = UIView()
        let plusViewDim: CGFloat = 20
        
        plusView.backgroundColor = .red
        plusView.layer.cornerRadius = plusViewDim / 2
        plusView.layer.masksToBounds = true
        addSubview(plusView)
        plusView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(plusViewDim)
            make.top.equalTo(containerView.snp.bottom).offset(-plusViewDim / 2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height / 2
        containerView.layer.masksToBounds = true
        imageView.layer.cornerRadius = containerView.frame.height * 0.9 / 2
        imageView.layer.masksToBounds = true
    }
}
