//
//  FeedsListTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedsListTableViewController: UITableViewController {
    
    var chacked = Bool()
    
    var selectedIndexPaths = [IndexPath]()
    
    private var rssFeeds = [String]()
    
    private var titleOne = [RSSItem]()
    
    var feeds = NewsCategories(rawValue: "")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavouriteStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update1()
        
        navigationItem.title = feeds?.rawValue
    }
    
    func update1 () {
        switch feeds {
        case .football: rssFeeds = ["Football - Rambler", "Sport.Ru / Footbal", "Sport - Express. Football"]
        case .hockey: rssFeeds = ["Hockey - Rambler", "Sport.Ru / Hockey", "Sport - Express. Hockey"]
        case .basketball: rssFeeds = ["Basketball - Rambler", "Sport.Ru / Basketball", "Sport - Express. Basketball"]
        case .tennis: rssFeeds = ["Tennis - Rambler", "Sport.Ru / Tennis", "Sport - Express. Tennis"]
        case .formula1: rssFeeds = ["Formula-1 - Rambler", "Sport.Ru / Formula-1", "Sport - Express. Formula-1"]
        case .none:
            break
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rssFeeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! FeedTableViewCell
        
        let feed = rssFeeds[indexPath.row]
        cell.feed = feed
        
        if chacked == false {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                let index = rssFeeds[indexPath.row]
                DataManager.shared.saveFavouriteStatus(for: index, with: false)
            } else {
                cell.accessoryType = .checkmark
                let index = rssFeeds[indexPath.row]
                DataManager.shared.saveFavouriteStatus(for: index, with: true)
            }
        }
    }
    
    private func loadFavouriteStatus() {
        for rssFeed in rssFeeds {
            chacked = DataManager.shared.loadFavouriteStatus(for: rssFeed)
        }
    }
}
