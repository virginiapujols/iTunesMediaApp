//
//  ImageView+Extension.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
