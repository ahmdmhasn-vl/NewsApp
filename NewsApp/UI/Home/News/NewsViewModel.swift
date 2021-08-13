//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    @Published var errorResponse : String?

    func loadRecentArticles() {
        let dataSource = ArticlesDataSource()
        dataSource.loadRecentArticles(query : "tesla",from: "2021-07-13") { (status, response) in
            switch (status){
            case .sucess:
                self.articles = response as? [Article] ?? [Article]()
                print(self.articles.count)
                break
            case .error:
                self.errorResponse = response as? String
                break
            case .networkError:
                break
            }
        }
    }
    
    
    
    
}
