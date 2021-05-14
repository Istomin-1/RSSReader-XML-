//
//  SubscriptionTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    var subscription: String! {
        didSet {
            textLabel?.text = subscription
           
        }
    }
}
