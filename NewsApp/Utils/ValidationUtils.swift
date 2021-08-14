//
//  ValidationUtils.swift
//  NewsApp
//
//  Created by Amr Ahmed on 14/08/2021.
//

import Foundation

class ValidationUtils {
    
    
   static func isValidCountry(slectedCountry : Country) -> Bool {
        return (slectedCountry.id == -1) ? false : true
    }
    
    static func isValidCategoriesCount(selectedCategories : [ArticleCategory]) -> Bool{
        return (selectedCategories.count > 0 && selectedCategories.count <= 3) ? true : false
        
    }
    
}
