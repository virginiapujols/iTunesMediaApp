//
//  MediaContentRequest.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

struct MediaContentRequest: Request {
    typealias Response = MediaResponse
    var path: String
    
    init(type: String) {
        // type can either be: audiobooks/top-audiobooks or apple-music/coming-soon
        path = "/\(type)/all/10/explicit.json"
    }
}
