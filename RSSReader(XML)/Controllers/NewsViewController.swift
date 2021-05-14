//
//  NewsViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    var rssItem: RSSItem!
    
    @IBOutlet weak var news: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news.text = rssItem.title
        descriptionLabel.text = rssItem.description
        dateLabel.text = rssItem.publicationDate
    }
}
