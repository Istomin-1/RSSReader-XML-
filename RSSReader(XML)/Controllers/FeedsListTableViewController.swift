//
//  FeedsListTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedsListTableViewController: UITableViewController {
    
    private var rssItems: [String]?
//    var feeds = [String]()
    
    var feeds = NewsCategories.football
    
    func update () {
        switch feeds {
        case .football: rssItems = ["https://www.sport-express.ru/services/materials/news/football/se/", "https://www.sport-express.ru/services/materials/news/hockey/se/"]
        case .hockey: rssItems = ["https://www.sport-express.ru/services/materials/news/hockey/se/"]
        case .basketball: rssItems = ["https://www.sport-express.ru/services/materials/news/basketball/se/"]
        case .tennis: rssItems = ["https://www.sport-express.ru/services/materials/news/tennis/se/"]
        case .formula1: rssItems = ["https://www.sport-express.ru/services/materials/news/formula1/se/"]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
//        let start: Set<String> = ["Wow", "Boom"]
//        feeds.append(contentsOf: start)
    }

    private func fetchData() {
        for rssItem in rssItems! {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: rssItem) { rssItems in
//            self.rssItems = rssItems
            
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
        }
        }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rssItems = rssItems else { return 0 }
        return rssItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! FeedTableViewCell
        
        let feed = rssItems?[indexPath.row]
//        cell.feed = feed

        return cell
    }
}
