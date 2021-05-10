//
//  CategoryTableViewCell.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    var category: String! {
        didSet {
            textLabel?.text = category
        }
    }
}
