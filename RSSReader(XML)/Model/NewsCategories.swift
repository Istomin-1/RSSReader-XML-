//
//  NewsCategories.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 11.05.2021.
//

import Foundation

enum NewsCategories: String, CaseIterable {
    case football = "Football"
    case hockey = "Hockey"
    case basketball = "Basketball"
    case tennis = "Tennis"
    case formula1 = "Formula-1"
}

enum RssSource: String, CaseIterable {
    case footballRambler = "https://sport.rambler.ru/rss/football/"
    case footballSporsRu = "https://www.sport.ru/rssfeeds/football.rss"
    case footballSportExpress = "https://www.sport-express.ru/services/materials/news/football/se/"
    case hockeyRambler = "https://sport.rambler.ru/rss/hockey/"
    case hockeySportsRu = "https://www.sport.ru/rssfeeds/hockey.rss"
    case hockeySportExpress = "https://www.sport-express.ru/services/materials/news/hockey/se/"
    case basketballRambler = "https://sport.rambler.ru/rss/basketball/"
    case basketballSporsRu = "https://www.sport.ru/rssfeeds/basketball.rss"
    case basketballSportExpress = "https://www.sport-express.ru/services/materials/news/basketball/se/"
    case tennisRambler = "https://sport.rambler.ru/rss/tennis/"
    case tennisSporsRu = "https://www.sport.ru/rssfeeds/tennis.rss"
    case tennisSportExpress = "https://www.sport-express.ru/services/materials/news/tennis/se/"
    case formula1Rambler = "https://sport.rambler.ru/rss/autosport/"
    case formula1SporsRu = "https://www.sport.ru/rssfeeds/formula1.rss"
    case formula1Express = "https://www.sport-express.ru/services/materials/news/formula1/se/"
}



