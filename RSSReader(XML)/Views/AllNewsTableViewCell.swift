//
//  SubscriptionTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class AllNewsTableViewCell: UITableViewCell {

    var subscription: String! {
        didSet {
            textLabel?.text = subscription
            imageView?.image = #imageLiteral(resourceName: "40")
            textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
}
