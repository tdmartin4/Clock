//
//  RootTabBarVC.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

class RootTabBarVC: UITabBarController {
    private let placeholderVC = UIViewController()

    init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
        
        // Configure UI
        tabBar.isTranslucent = false
        tabBar.barTintColor = .primary
        tabBar.tintColor = .onPrimary
        
        // Setup View Controllers
        let homeVC = VideoListVC(dataProvider: MockVideoListDataProvider())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: .home, tag: 0)
        
        let discoverVC = UIViewController()
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: .discover, tag: 1)
                
        let inboxVC = UIViewController()
        inboxVC.tabBarItem = UITabBarItem(title: "Inbox", image: .inbox, tag: 2)
        
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Me", image: .profile, tag: 3)
        
        viewControllers = [homeVC, discoverVC, placeholderVC, inboxVC, profileVC]
        setupCaptureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCaptureButton() {
        let captureVideoButton = UIButton()
        captureVideoButton.backgroundColor = .onPrimary
        captureVideoButton.layer.cornerRadius = 8
        captureVideoButton.layer.masksToBounds = true
        
        view.addSubview(captureVideoButton)
        let bottomPadding = UIApplication.shared.windows[0].safeAreaInsets.bottom
        captureVideoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(tabBar).offset(-bottomPadding / 2)
            make.width.equalToSuperview().multipliedBy(0.125)
            make.height.equalTo(captureVideoButton.snp.width).multipliedBy(0.66)
        }
        
        let addImageView = UIImageView(image: .plus)
        addImageView.tintColor = .primary
        captureVideoButton.addSubview(addImageView)
        addImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(addImageView.snp.height)
        }
    }
}

extension RootTabBarVC: UITabBarControllerDelegate {
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        return viewController != placeholderVC
    }
}
