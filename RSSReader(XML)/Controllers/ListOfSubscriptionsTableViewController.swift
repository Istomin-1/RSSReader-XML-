//
//  ListOfSubscriptionsTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class ListOfSubscriptionsTableViewController: UITableViewController {
    
    var subscriptions = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(tableView, selector: #selector(UITableView.reloadData), name: SubscriptionsController.subscriptionUpdateNotification, object: nil)
    }
    
//    private func fetchData() {
//        for rssItem in rssFeeds {
//            let feedParser = FeedParser()
//            feedParser.parseFeed(url: rssItem) { rssFeedTitle  in
//            
//                guard let title = rssFeedTitle.first else { return }
//                self.titleOne.append(title)
//                
//                DispatchQueue.main.async {
//                    let newIndexPath = IndexPath(row: self.titleOne.count - 1, section: 0)
//                    self.tableView.insertRows(at: [newIndexPath], with: .automatic)
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }
    
//    func update () {
//        switch feeds {
//        case .football: rssFeeds = ["https://www.sport-express.ru/services/materials/news/football/se/", "https://www.sport.ru/rssfeeds/football.rss", "https://sport.rambler.ru/rss/football/"]
//        case .hockey: rssFeeds = ["https://www.sport-express.ru/services/materials/news/hockey/se/", "https://www.sport.ru/rssfeeds/hockey.rss", "https://sport.rambler.ru/rss/hockey/", "https://news.yandex.ru/hockey.html?from=rss"]
//        case .basketball: rssFeeds = ["https://www.sport-express.ru/services/materials/news/basketball/se/", "https://www.sport.ru/rssfeeds/basketball.rss", "https://sport.rambler.ru/rss/basketball/"]
//        case .tennis: rssFeeds = ["https://www.sport-express.ru/services/materials/news/tennis/se/", "https://www.sport.ru/rssfeeds/tennis.rss", "https://sport.rambler.ru/rss/tennis/"]
//        case .formula1: rssFeeds = ["https://www.sport-express.ru/services/materials/news/formula1/se/", "https://www.sport.ru/rssfeeds/formula1.rss", "https://sport.rambler.ru/rss/autosport/"]
//        case .none:
//            break
//        }
//    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubscriptionsController.shared.subscriptionsFeed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionCell", for: indexPath) as! SubscriptionTableViewCell
        
        let subscription = subscriptions[indexPath.row]
        cell.subscription = subscription

        return cell
    }
}
