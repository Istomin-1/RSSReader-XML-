//
//  DataManager.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 14.05.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(for titleFeed: String, with status: Bool) {
        userDefaults.set(status, forKey: titleFeed)
    }
    
    func loadFavouriteStatus(for titleFeed: String) -> Bool {
        return userDefaults.bool(forKey: titleFeed)
    }
    
}
