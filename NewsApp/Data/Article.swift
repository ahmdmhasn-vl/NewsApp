//
//  News.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation
import ObjectMapper

class Article : Identifiable,Equatable, Mappable {
    
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.publishedAt == rhs.publishedAt
    }
    
    
    var source : Source?
    var author : String?
    var title : String?
    var articleDescription : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    
    
    init() {
        
    }
    func mapping(map: ObjectMapper.Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        articleDescription <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
    
    required init?(map: ObjectMapper.Map) {
        source = Source()
        author = ""
        title = ""
        articleDescription = ""
        url = ""
        urlToImage = ""
        
    }
}
