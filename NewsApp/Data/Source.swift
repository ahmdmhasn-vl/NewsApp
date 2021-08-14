//
//  Source.swift
//  NewsApp
//
//  Created by Amr Ahmed on 14/08/2021.
//

import Foundation
import ObjectMapper

class Source: Identifiable,Mappable {
     var id : Int?
     var name : String?
   
    init() {
        
    }
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    required init?(map: ObjectMapper.Map) {
        id = 0
        name = ""
    }
}
