//
//  BaseDataSource.swift
//  TandaRevamp
//
//  Created by Amr Ahmed on 18/01/2021.
//

import Foundation
import Alamofire

class BaseDataSource {
    
    
    let baseURL = "https://newsapi.org/v2/everything"
    
    func BaseAPI(endpoint:String , method: Alamofire.HTTPMethod,params:[String:Any]? ,completion:@escaping([String:Any]?,String?)->Void){
        
        let url = baseURL + endpoint

        AF.request(url, method:method, parameters:params, encoding:JSONEncoding.default, headers:getHeaders()).validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch(response.result){
                case .success(_):
                    let json = response.value
                    print(json)
                    completion(json as? [String : Any],nil)
                    break
                case .failure(_):
                    if let data = response.data {
                        let json = String(data: data, encoding: .utf8)
//                        let errorResponse = BaseResponse(JSONString: json ?? "")
//                        completion(nil,errorResponse?.message)
                    }
                    break
                }
            }
    }
    
    
    func BaseAPIWithErrorResponse(endpoint:String , method: Alamofire.HTTPMethod,params:[String:Any]? ,completion:@escaping([String:Any]?,Any?)->Void){
        
        let url = baseURL + endpoint

        AF.request(url, method:method, parameters:params, encoding:JSONEncoding.default, headers:getHeaders()).validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch(response.result){
                case .success(_):
                    let json = response.value
                    print(json)
                    completion(json as? [String : Any],nil)
                    break
                case .failure(_):
                    if let data = response.data {
                        let json = String(data: data, encoding: .utf8)
//                        let errorResponse = BaseResponse(JSONString: json ?? "")
//                        completion(nil,errorResponse)
                    }
                    break
                }
            }
    }
    
    func BaseAPIWithCustomHeaders(endpoint:String , method: Alamofire.HTTPMethod,params:[String:Any]?,headers : HTTPHeaders ,completion:@escaping([String:Any]?,String?)->Void){
        
        let url = baseURL + endpoint

        AF.request(url, method:method, parameters:params, encoding:JSONEncoding.default, headers:headers).validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch(response.result){
                case .success(_):
                    let json = response.value
                    print(json)
                    completion(json as? [String : Any],nil)
                    break
                case .failure(_):
                    if let data = response.data {
//                        let json = String(data: data, encoding: .utf8)
//                        let errorResponse = BaseResponse(JSONString: json ?? "")
//                        completion(nil,errorResponse?.message)
                    }
                    break
                }
            }
    }
    
    
    func getHeaders ()-> HTTPHeaders{
        let headers: HTTPHeaders = [
            .accept("application/json"),
            .authorization(bearerToken: "")
        ]
        return headers
    }
    
    public enum ResponseStatus: String {
        case error = "error"
        case sucess = "success"
        case networkError = "networkError"
    }
}
