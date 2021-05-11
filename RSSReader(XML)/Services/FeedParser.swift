//
//  FeedParser.swift
//  RSSReader(XML)
//
//  Created by Mikhail on 11.05.2021.
//

import Foundation

class FeedParser: NSObject, XMLParserDelegate {
    
    private var rssItems: [RSSItem] = []
    private var currentElement = ""
    
//    private var titleFeed: String = "" {
//        didSet {
//            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//        }
//    }
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPublicationDate: String = "" {
        didSet {
            currentPublicationDate = currentPublicationDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parseComplitionHandler: (([RSSItem]) -> Void)?
    
    func parseFeed(url: String, complitionHandler: (([RSSItem]) -> Void)?) {
        self.parseComplitionHandler = complitionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { data, URLResponse, error in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    // MARK: XML Parser Delegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPublicationDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentElement += string
        case "description": currentDescription += string
        case "pubDate": currentPublicationDate += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, publicationDate: currentPublicationDate)
            self.rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parseComplitionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}
