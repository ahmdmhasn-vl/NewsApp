//
//  Country.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation
class Country : Codable {
    
    var id = 0
    var name = ""
    var isSelected = false
    
    init() {
        
    }
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}
