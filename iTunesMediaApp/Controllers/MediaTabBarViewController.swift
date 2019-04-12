//
//  MediaTabBarViewController.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

class MediaTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioBookController = MediaContentListController(type: "audiobooks/top-audiobooks")
        let musicController = MediaContentListController(type: "tv-shows/top-tv-episodes")
        
        audioBookController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        musicController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        viewControllers = [audioBookController, musicController]
    }

}
