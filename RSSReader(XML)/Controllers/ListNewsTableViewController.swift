//
//  ListNewsTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class ListNewsTableViewController: UITableViewController {
    
    private var allNews = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let start: Set<String> = ["What?", "Yes!"]
        allNews.append(contentsOf: start)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        let news = allNews[indexPath.row]
        cell.news = news
        
        return cell
    }
    
    @IBAction func unwindToListNews(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            
        }
    }
}
