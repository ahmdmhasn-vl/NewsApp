//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation
import CoreData

class NewsViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    @Published var errorResponse : String?
    @Published var favoriteList = [Article]()
    var coreDataUtils : CoreDataUtil?


    func loadRecentArticles(searchKey : String) {
        let dataSource = ArticlesDataSource()
        dataSource.loadRecentArticles(query : searchKey,from: "2021-08-13") { (status, response) in
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
    
    func handleFavourit(article : Article) {
        if isArticleExist(article: article) {
            removeItemFromFavurits(article: article)
        }else{
            saveToFavorite(article: article)
        }
    }
    
    func saveToFavorite(article : Article)  {
        coreDataUtils?.addTooFavorite(article: article)
    }
    
    func isArticleExist(article : Article) -> Bool{
        return coreDataUtils!.isArticleExist(article: article)
    }
    
    func removeItemFromFavurits(article : Article) {
        coreDataUtils?.deleteFromFavorite(article: article)
        if(favoriteList.count > 0){
            let index = favoriteList.firstIndex(of: article)
            favoriteList.remove(at: index ?? -1)
        }
    }
    
    func loadFavoriteList() {
        let mFavorites = coreDataUtils?.loadFavorits()
        var mArticles = [Article]()
        for favorite in mFavorites ?? [Favorite]() {
            mArticles.append((coreDataUtils?.mapToArticle(favorite: favorite))!)
        }
        favoriteList = mArticles
    }
    
    
    
    
    
}
