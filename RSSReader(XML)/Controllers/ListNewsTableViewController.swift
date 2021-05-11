//
//  ListNewsTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class ListNewsTableViewController: UITableViewController {
    
    private var rssItems: [RSSItem]?
    private var allNews = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
//        let start: Set<String> = ["What?", "Yes!"]
//        allNews.append(contentsOf: start)
    }
    
    private func fetchData() {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://www.sport-express.ru/services/materials/news/football/se/") { rssItems in
            self.rssItems = rssItems
            
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        let news = rssItems?[indexPath.row]
        cell.news = news
        
        return cell
    }
    
    @IBAction func unwindToListNews(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            
        }
    }
}
