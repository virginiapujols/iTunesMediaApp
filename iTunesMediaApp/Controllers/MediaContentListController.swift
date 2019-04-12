//
//  ViewController.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

class MediaContentListController: UIViewController {
    let apiClient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testAPICall()
    }

    func testAPICall() {
        let request = MediaContentRequest(type: "audiobooks/top-audiobooks")
        apiClient.getAllMediaContent(request, completion: { response in
            if let feed = response as? MediaFeed {
                for item in feed.mediaContent {
                    print(item.name)
                }

                DispatchQueue.main.async {
                    self.title = feed.title

                }
            }
        })
    }

}

