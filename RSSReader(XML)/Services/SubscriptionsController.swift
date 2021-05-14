//
//  SubscriptionsController.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 14.05.2021.
//

import UIKit

class SubscriptionsController: UIViewController {
    
    static let shared = SubscriptionsController()
    
    var subscriptionsFeed = [RSSItem]() {
        didSet{
            NotificationCenter.default.post(name: SubscriptionsController.subscriptionUpdateNotification, object: nil)
        }
    }
    
    static let subscriptionUpdateNotification = Notification.Name("SubscriptionsController.subscriptionUpdate")

}
