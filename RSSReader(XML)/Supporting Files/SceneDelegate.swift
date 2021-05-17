//
//  SceneDelegate.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 10.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var orderTabBarItem: UITabBarItem!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateOrderBadge), name: SubscriptionsController.subscriptionUpdateNotification, object: nil)
        
        orderTabBarItem = (self.window!.rootViewController! as! UITabBarController).viewControllers![1].tabBarItem!
        
        let startSubscriptions = DataManager.shared.subscriptionsTitle
        
        SubscriptionsController.shared.subscriptionsFeed = startSubscriptions
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    @objc func updateOrderBadge() {
        switch SubscriptionsController.shared.subscriptionsFeed.count {
        case 0:
            orderTabBarItem.badgeValue = nil
        case let count:
            orderTabBarItem.badgeValue = String(count)
        }
    }
}

