//
//  NewsDataSource.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import Foundation

class ArticlesDataSource : BaseDataSource  {
    
    
    func loadRecentArticles(query : String ,from : String, completion:@escaping(ResponseStatus,Any)->Void) {
        
        let params = ["q" : query,
                      "from" : from,
                      "sortBy" : "publishedAt",
                      "apiKey" : Constants.API_KEY]
        
        let url = baseURL + queryString(urlString: "everything" , params : params)
        
        BaseAPI(url: url , method:  .get , params: nil, headers: nil) { (json, error) in
            if json != nil {
                let respone = ArticlesResponse.getArticlesResponse(dict: json ?? [:])
                if respone.status == "ok" {
                    completion(.sucess , respone.articles)
                }else{
                    completion(.error , "")
                }
            }else{
                if (error != nil){
                    completion(.networkError , error!.localizedDescription)
                }
                else{
                    completion(.networkError,"Something went wrong!")
                }
            }
        }
        
    }
    
    
}
