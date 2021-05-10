//
//  NewsViewController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var news: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        news.text = "Good"
    }
}
