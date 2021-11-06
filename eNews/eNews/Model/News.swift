//
//  News.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import Foundation
import RealmSwift
import SwiftyJSON

class News: Object {
    @objc var id = ""
    @objc var name = ""
    @objc var author = ""
    @objc var title = ""
    @objc var descriptionNews = ""
    @objc var url = ""
    @objc var urlToImage = ""
    @objc var publishedAt = ""
    @objc var content = ""
    
    func populateJSON(_ json: JSON) {
        id = json["source"]["id"].stringValue
        name = json["source"]["name"].stringValue
        author = json["author"].stringValue
        title = json["title"].stringValue
        descriptionNews = json["description"].stringValue
        url = json["url"].stringValue
        urlToImage = json["urlToImage"].stringValue
        publishedAt = json["publishedAt"].stringValue
        content = json["content"].stringValue
    }
}
