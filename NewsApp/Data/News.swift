//
//  News.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation
import ObjectMapper

class Article : Mappable {
    
    var source : Source?
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
   
    func mapping(map: Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
    
    required init?(map: Map) {
        source = Source()
        author = ""
        title = ""
        description = ""
        url = ""
        urlToImage = ""
        publishedAt = ""
        
    }
    
    class Source: Mappable {
        var id : Int?
        var name : String?
        
        init() {
            
        }
        func mapping(map: Map) {
            id <- map["id"]
            name <- map["names"]
        }
        
        required init?(map: Map) {
            id = 0
            name = ""
        }
    }
}
