//
//  News.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class News {
    let title: String
    let author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    convenience init?(from dict: [String: Any]) {
        let theTitle = dict["title"] as? String ?? "Unknown title"
        let theAuthor = dict["author"] as? String ?? "Unknown author"
        self.init(title: theTitle, author: theAuthor)
    }
    
    static func getNews(from data: Data) -> [News] {
        var news = [News]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let newsDict = json as? [String: Any] else { return [] }
            guard let articlesArr = newsDict["articles"] as? [[String: Any]] else { return [] }
            for articleDict in articlesArr {
                if let newNews = News(from: articleDict) {
                    news.append(newNews)
                }
            }
        }
        catch {
            print("Error")
        }
        return news
    }
    
}
