//
//  DataManager.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 17.05.2021.
//

import Foundation

class DataManager {
    
    private enum SettingKeys: String {
        case userSub
    }
    
    static let shared = DataManager()
    
    func saveFavouriteFeed(for title: String, with status: Bool) {
        UserDefaults.standard.set(status, forKey: title)
    }
    
    func loadFavouriteStatus(for title: String) -> Bool {
        return UserDefaults.standard.bool(forKey: title)
    }
    
    var subscriptionsTitle: [String] {
        get {
            guard let array = UserDefaults.standard.array(forKey: SettingKeys.userSub.rawValue) as? [String] else { return [] }
            return array
        }
        set {
            UserDefaults.standard.set(newValue, forKey: SettingKeys.userSub.rawValue)
        }
    }
}
