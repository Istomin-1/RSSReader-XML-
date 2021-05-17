//
//  NewsViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    //    MARK: - Properties
    var rssItem: RSSItem!
    
    @IBOutlet weak var news: UILabel! {
        didSet {
            news.text = rssItem.title
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = rssItem.description
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            let timeStringGet = DateFormatter()
            timeStringGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
            
            let timePrint = DateFormatter()
            timePrint.dateFormat = "E, d MMM yyyy HH:mm"
            
            guard let timeNew = timeStringGet.date(from: rssItem.publicationDate) else { return }
            let timeString = timePrint.string(from: timeNew)
            
            dateLabel.text = timeString
        }
    }
}
