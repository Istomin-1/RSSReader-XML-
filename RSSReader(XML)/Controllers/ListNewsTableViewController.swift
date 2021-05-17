//
//  ListNewsTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class ListNewsTableViewController: UITableViewController {
    
    //    MARK: - Properties
    private var url = RssSource(rawValue: "")
    private var rssItems: [RSSItem]?
    var rssFeed = String()
    
    //    MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed()
        fetchData()
        navigationItem.title = rssFeed
    }
    
    //    MARK: - Private Functions
    private func loadFeed () {
        switch rssFeed {
        case "Football - Rambler":
            url = .footballRambler
        case "Sport.Ru / Footbal":
            url = .footballSporsRu
        case "Sport - Express. Football":
            url = .footballSportExpress
        case "Hockey - Rambler":
            url = .hockeyRambler
        case "Sport.Ru / Hockey":
            url = .hockeySportsRu
        case "Sport - Express. Hockey":
            url = .hockeySportExpress
        case "Basketball - Rambler":
            url = .basketballRambler
        case "Sport.Ru / Basketball":
            url = .basketballSporsRu
        case "Sport - Express. Basketball":
            url = .basketballSportExpress
        case "Tennis - Rambler":
            url = .tennisRambler
        case "Sport.Ru / Tennis":
            url = .tennisSporsRu
        case "Sport - Express. Tennis":
            url = .tennisSportExpress
        case "Formula-1 - Rambler":
            url = .formula1Rambler
        case "Sport.Ru / Formula-1":
            url = .formula1SporsRu
        case "Sport - Express. Formula-1":
            url = .formula1Express
        default:
            break
        }
    }
    
    private func fetchData() {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: url!.rawValue) { rss in
            var rssItems = rss
            rssItems.removeFirst()
            self.rssItems = rssItems
            
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
    // MARK: - Table view data source + delegate
    
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
    
    //    MARK: - Navigation
    @IBAction func unwindToListNews(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsSegue" {
            let indexPath = tableView.indexPathForSelectedRow!
            let rssItem = rssItems?[indexPath.row]
            let newsVC = segue.destination as! NewsViewController
            newsVC.rssItem = rssItem
        }
    }
}
