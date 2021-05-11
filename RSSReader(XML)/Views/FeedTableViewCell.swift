//
//  ChannelTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var feed: RSSItem! {
        didSet {
            textLabel?.text = feed.title
            detailTextLabel?.text = feed.description
        }
    }
}
