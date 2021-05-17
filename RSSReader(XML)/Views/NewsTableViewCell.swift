//
//  NewsTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleNewsLabel: UILabel! {
        didSet {
            titleNewsLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var descriptionNewsLabel: UILabel! {
        didSet {
            descriptionNewsLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var publicationDateLabel: UILabel!
    
    var news: RSSItem! {
        didSet {
            titleNewsLabel.text = news.title
            descriptionNewsLabel.text = news.description
            
            let timeStringGet = DateFormatter()
            timeStringGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
            
            let timePrint = DateFormatter()
            timePrint.dateFormat = "E, d MMM yyyy HH:mm"
            
            guard let timeNew = timeStringGet.date(from: news.publicationDate) else { return }
            let timeString = timePrint.string(from: timeNew)
            
            publicationDateLabel.text = timeString
        }
    }
}
