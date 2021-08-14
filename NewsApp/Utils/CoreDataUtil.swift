//
//  CoreDataUtil.swift
//  NewsApp
//
//  Created by Amr Ahmed on 14/08/2021.
//

import Foundation
import CoreData

class CoreDataUtil {
    
    var viewContext = NSManagedObjectContext()

    func initialize(viewContext : NSManagedObjectContext)  {
        self.viewContext = viewContext
    }
    
    func addTooFavorite(article : Article)  {
        let mFavorite = Favorite(context: viewContext)
        mFavorite.author = article.author
        mFavorite.imageUrl = article.urlToImage
        mFavorite.articleDescription = article.articleDescription
        mFavorite.publishedAt = article.publishedAt
        mFavorite.title = article.title
        mFavorite.source = article.source?.name
        mFavorite.url = article.url
        do {
            try viewContext.save()
            print("Item saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteFromFavorite(article : Article)  {
        let favorits = loadFavorits()
        for favorite in favorits {
            if favorite.publishedAt == article.publishedAt {
                viewContext.delete(favorite)
                print("Item Deleted.")
                break
            }
        }
    }
    
    func loadFavorits() -> [Favorite] {
        var favorits  = [Favorite]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        do {
            favorits = try viewContext.fetch(fetchRequest) as? [Favorite] ?? [Favorite]()
            return favorits
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return [Favorite]()
    }
    
    func mapToArticle(favorite:Favorite) -> Article {
        let article = Article()
        article.articleDescription = favorite.articleDescription
        article.author = favorite.author
        article.publishedAt = favorite.publishedAt
        article.title = favorite.title
        article.urlToImage = favorite.imageUrl
        article.source = Source()
        article.source?.name = favorite.source
        article.url = favorite.url
        return article
    }
    
    func isArticleExist(article : Article) -> Bool {
        let favorits = loadFavorits()
        for favorite in favorits {
            if favorite.publishedAt == article.publishedAt {
               return true
            }
        }
        return false
    }

}
