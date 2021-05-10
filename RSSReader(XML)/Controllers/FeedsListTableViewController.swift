//
//  FeedsListTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedsListTableViewController: UITableViewController {
    
    var feeds = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let start: Set<String> = ["Wow", "Boom"]
        feeds.append(contentsOf: start)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! FeedTableViewCell
        
        let feed = feeds[indexPath.row]
        cell.feed = feed

        return cell
    }
}
