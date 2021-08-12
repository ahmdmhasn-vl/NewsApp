//
//  DefaultsUtils.swift
//  DareYourBody
//
//  Created by Amr Ahmed on 8/13/18.
//  Copyright © 2018 Amr Ahmed. All rights reserved.
//

import UIKit

class DefaultsUtils: NSObject {
    
    static func saveCountry(country: Country) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(country)
            UserDefaults.standard.set(data, forKey: Constants.country)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    static func loadCountry() -> Country {
        if let data = UserDefaults.standard.data(forKey: Constants.country) {
            do {
                let decoder = JSONDecoder()
                let country = try decoder.decode(Country.self, from: data)
                return country
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return Country()
    }
    
    static func saveNewsCategories(newsCategories : [NewsCategory]){
        UserDefaults.standard.newsCategories = newsCategories
    }
    
    static func loadNewsCategories() -> [NewsCategory]{
        UserDefaults.standard.newsCategories
    }
}

extension UserDefaults {
    var newsCategories: [NewsCategory] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Constants.newsCategoriesKey) else { return [] }
            return (try? PropertyListDecoder().decode([NewsCategory].self, from: data)) ?? []
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: Constants.newsCategoriesKey)
        }
    }
}
