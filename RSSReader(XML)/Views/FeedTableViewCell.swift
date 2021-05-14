//
//  ChannelTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var feed: String! {
        didSet {
            textLabel?.text = feed
//            accessoryType = .none
        }
    }
}
