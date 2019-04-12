//
//  MediaContent.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//


struct MediaContent: Codable {
    var name: String
    var type: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "kind"
        case imageUrl = "artworkUrl100"
    }
}
