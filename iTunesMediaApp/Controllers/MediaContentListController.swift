//
//  ViewController.swift
//  iTunesMediaApp
//
//  Created by Virginia Pujols on 4/11/19.
//  Copyright © 2019 Virginia Pujols. All rights reserved.
//

import UIKit

class MediaContentListController: UITableViewController {
    let apiClient = ApiClient()
    var contentType: String
    var mediaList = [MediaContent]()
    
    init(type: String) {
        contentType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestMediaContent(contentType)
    }
    
    // MARK:
    func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_media")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func requestMediaContent(_ type:String) {
        let request = MediaContentRequest(type: type)
        apiClient.getAllMediaContent(request) { (response) in
            if let feed = response as? MediaFeed {
                self.mediaList = feed.mediaContent
                DispatchQueue.main.async {
                    self.title = feed.title
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: Tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_media", for: indexPath)
        let currentItem = mediaList[indexPath.row]
        
        cell.textLabel?.text = currentItem.name
        
        return cell
    }
}

