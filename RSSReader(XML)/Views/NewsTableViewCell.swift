//
//  NewsTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var news: String! {
        didSet {
            textLabel?.text = news
        }
    }
}
