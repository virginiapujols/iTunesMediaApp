//
//  Request.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

protocol Request {
    associatedtype Response: Decodable
    var path:String { get }
}
