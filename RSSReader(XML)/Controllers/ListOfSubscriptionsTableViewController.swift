//
//  ListOfSubscriptionsTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class ListOfSubscriptionsTableViewController: UITableViewController {
    
    //    MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        NotificationCenter.default.addObserver(tableView!, selector: #selector(UITableView.reloadData), name: SubscriptionsController.subscriptionUpdateNotification, object: nil)
    }
    
    // MARK: - Table view data source + delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubscriptionsController.shared.subscriptionsFeed.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionCell", for: indexPath) as! AllNewsTableViewCell
        
        let subscription = SubscriptionsController.shared.subscriptionsFeed[indexPath.row]
        
        cell.subscription = subscription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = SubscriptionsController.shared.subscriptionsFeed[indexPath.row]
            DataManager.shared.saveFavouriteFeed(for: index, with: false)
            SubscriptionsController.shared.subscriptionsFeed.remove(at: indexPath.row)
            DataManager.shared.subscriptionsTitle.remove(at: indexPath.row)
        }
    }
    
    //    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedSegue" {
            let indexPath = tableView.indexPathForSelectedRow!
            let subscription = SubscriptionsController.shared.subscriptionsFeed[indexPath.row]
            let newsTVC = segue.destination as! ListNewsTableViewController
            newsTVC.rssFeed = subscription
        }
    }
}
