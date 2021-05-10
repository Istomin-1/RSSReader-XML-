//
//  NewsСategoriesTableViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsCategoriesTableViewController: UITableViewController {
    
    private var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let start: Set<String> = ["Sport", "Tech"]
        categories.append(contentsOf: start)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        let cayegory = categories[indexPath.row]
        cell.category = cayegory
        return cell
    }
}
