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
        self.title = "iTunes Media App"
        requestMediaContent(contentType)
    }
    
    // MARK: private functions
    private func setupView() {
        tableView.register(MediaContentTableCell.self, forCellReuseIdentifier: "cell_media")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func requestMediaContent(_ type:String) {
        let request = MediaContentRequest(type: type)
        apiClient.getAllMediaContent(request) { (response) in
            if let feed = response as? MediaFeed {
                self.mediaList = feed.mediaContent
                DispatchQueue.main.async {
                    self.navigationController?.navigationBar.topItem?.title = feed.title
//                    navigationController?.navigationBar.topItem?.title = "some title"
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: Tableview
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_media", for: indexPath) as! MediaContentTableCell
        let currentItem = mediaList[indexPath.row]
        
        cell.nameLabel.text = currentItem.name
        cell.typeLabel.text = currentItem.type
        
        if let imageUrl = URL(string: currentItem.imageUrl) {
            cell.iconImageView.loadFromURL(url: imageUrl)
        }

        return cell
    }
}

