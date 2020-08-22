//
//  File.swift
//  Clock
//
//  Created by Tommy Martin on 8/9/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

class VideoButton: UIControl {
    private let imageView = UIImageView()
    private let titleLabel = UILabel(font: .body, textColor: .onVideo)
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        
        set {
            titleLabel.text = newValue
        }
    }
    
    init(image: UIImage? = nil, title: String? = nil) {
        super.init(frame: .zero)

        imageView.image = image
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
