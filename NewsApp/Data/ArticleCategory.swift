//
//  Category.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import Foundation

class ArticleCategory : Hashable,Codable {
    
    static func == (lhs: ArticleCategory, rhs: ArticleCategory) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
           hasher.combine(title)
    }
    
    var id = 0
    var title = ""
    var isSelected = false
    init(id : Int,title : String) {
        self.id = id
        self.title = title
    }
}
