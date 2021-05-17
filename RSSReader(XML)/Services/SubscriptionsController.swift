//
//  SubscriptionsController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 14.05.2021.
//

import UIKit

class SubscriptionsController: UIViewController {
    
    static let shared = SubscriptionsController()
    
    static let subscriptionUpdateNotification = Notification.Name("SubscriptionsController.subscriptionUpdate")
    
    var subscriptionsFeed = [String]() {
        
        didSet{
            NotificationCenter.default.post(name: SubscriptionsController.subscriptionUpdateNotification, object: nil)
        }
    }
}

