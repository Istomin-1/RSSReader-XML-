//
//  FeedsListTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedsListTableViewController: UITableViewController {
    
    //    MARK: - Properties
    private var checkmark = [Bool]()
    private var newsTitle = [String]()
    var feeds = NewsCategories(rawValue: "")
    
    //    MARK: - Life Cicle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCheckmark()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFeeds()
        navigationItem.title = feeds?.rawValue
    }
    
    //    MARK: - Private Functions
    private func loadCheckmark() {
        for news in newsTitle {
            let newNews = DataManager.shared.loadFavouriteStatus(for: news)
            checkmark.append(newNews)
        }
    }
    
    private func updateFeeds () {
        switch feeds {
        case .football: newsTitle = ["Football - Rambler", "Sport.Ru / Footbal", "Sport - Express. Football"]
        case .hockey: newsTitle = ["Hockey - Rambler", "Sport.Ru / Hockey", "Sport - Express. Hockey"]
        case .basketball: newsTitle = ["Basketball - Rambler", "Sport.Ru / Basketball", "Sport - Express. Basketball"]
        case .tennis: newsTitle = ["Tennis - Rambler", "Sport.Ru / Tennis", "Sport - Express. Tennis"]
        case .formula1: newsTitle = ["Formula-1 - Rambler", "Sport.Ru / Formula-1", "Sport - Express. Formula-1"]
        case .none:
            break
        }
    }
    
    // MARK: - Table view data source + delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTitle.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! SubscriptionTableViewCell
        
        let feed = newsTitle[indexPath.row]
        cell.feed = feed
        let feed1 = checkmark[indexPath.row]
        
        if feed1 == false {
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
                let index = newsTitle[indexPath.row]
                DataManager.shared.saveFavouriteFeed(for: index, with: false)
                if SubscriptionsController.shared.subscriptionsFeed.contains(index) {
                    if let ndex = SubscriptionsController.shared.subscriptionsFeed.firstIndex(of: index) {
                        SubscriptionsController.shared.subscriptionsFeed.remove(at: ndex)
                        DataManager.shared.subscriptionsTitle.remove(at: ndex)
                    }
                }
            } else {
                cell.accessoryType = .checkmark
                let index = newsTitle[indexPath.row]
                DataManager.shared.saveFavouriteFeed(for: index, with: true)
                
                if !SubscriptionsController.shared.subscriptionsFeed.contains(index) {
                    SubscriptionsController.shared.subscriptionsFeed.append(index)
                    DataManager.shared.subscriptionsTitle.append(index)
                    print(DataManager.shared.subscriptionsTitle)
                }
            }
        }
    }
}

