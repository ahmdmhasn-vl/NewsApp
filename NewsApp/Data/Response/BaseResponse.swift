//
//  BaseResponse.swift
//  TandaRevamp
//
//  Created by Amr Ahmed on 18/01/2021.
//

import Foundation
import ObjectMapper


class BaseResponse: Mappable {
  
    var status : String?
    
    init() {
        
    }
    required init?(map: Map) {
        status = ""
    }
    
    func mapping(map: Map) {
        status <- map["status"]
    }
    
    
    static func getBaseResponse(dict : [String:Any]) ->  BaseResponse {
        return Mapper<BaseResponse>().map(JSON: dict)!
    }
}
