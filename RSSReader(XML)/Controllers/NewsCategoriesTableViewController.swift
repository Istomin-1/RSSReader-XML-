//
//  NewsСategoriesTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsCategoriesTableViewController: UITableViewController {
    
    //    MARK: - Properties
    private var categoriesNews = NewsCategories.allCases
    
    // MARK: - Table view data source + delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesNews.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        let cayegory = categoriesNews[indexPath.section]
        cell.category = cayegory.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    //    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subscriptionsSegue" {
            let indexPath = tableView.indexPathForSelectedRow!
            let category = categoriesNews[indexPath.section]
            let feedsListTVC = segue.destination as! FeedsListTableViewController
            feedsListTVC.feeds = category
        }
    }
}
