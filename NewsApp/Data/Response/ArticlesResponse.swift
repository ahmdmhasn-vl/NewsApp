//
//  ArticlesResponse.swift
//  NewsApp
//
//  Created by Amr Ahmed on 13/08/2021.
//

import Foundation
import ObjectMapper

class ArticlesResponse: BaseResponse {
    
    var articles = [Article]()
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        articles <- map["articles"]
    }
    
    static func getArticlesResponse(dict : [String:Any]) ->  ArticlesResponse {
        return Mapper<ArticlesResponse>().map(JSON: dict)!
    }
    
}
