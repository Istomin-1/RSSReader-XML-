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
        let start: Set<String> = ["Wow", "Boom"]
        subscriptions.append(contentsOf: start)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionCell", for: indexPath) as! SubscriptionTableViewCell
        
        let subscription = subscriptions[indexPath.row]
        cell.subscription = subscription

        return cell
    }
}
