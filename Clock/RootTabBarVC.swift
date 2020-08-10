//
//  RootTabBarVC.swift
//  Clock
//
//  Created by Tommy Martin on 8/2/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit

class RootTabBarVC: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Configure UI
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        
        // Setup View Controllers
        let homeVC = VideoListVC(dataProvider: MockVideoListDataProvider())
        let homeImage = UIImage(systemName: "house.fill")
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: homeImage, tag: 0)
        
        let discoverVC = DiscoverVC()
        let discoverImage = UIImage(systemName: "magnifyingglass")
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: discoverImage, tag: 1)
        
        let inboxVC = InboxVC()
        let inboxImage = UIImage(systemName: "tray.and.arrow.down.fill")
        inboxVC.tabBarItem = UITabBarItem(title: "Inbox", image: inboxImage, tag: 2)
        
        let profileVC = ProfileVC()
        let profileImage = UIImage(systemName: "person.fill")
        profileVC.tabBarItem = UITabBarItem(title: "Me", image: profileImage, tag: 3)
        
        viewControllers = [homeVC, discoverVC, inboxVC, profileVC]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

