//
//  ApiClient.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

struct ApiClient {
    let baseURL = "https://rss.itunes.apple.com/api/v1/us"
    let session = URLSession.shared
    
    func getAllMediaContent<T:Request>(_ request:T, completion: @escaping (Decodable) -> Void) {
        guard let url = URL(string: baseURL + request.path) else { return }
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print("Data not available")
                return
            }
            
            do {
                let decodedJson = try JSONDecoder().decode(T.Response.self, from: data)
                guard let response = decodedJson as? MediaResponse else { return }
                completion(response.feed)
            } catch {
                print("Error getting media content: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
