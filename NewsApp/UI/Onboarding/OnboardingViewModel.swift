//
//  OnboardingViewModel.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var categories = [
        ArticleCategory.init(id: 1, title: "Sports"),
        ArticleCategory.init(id: 2, title: "Art"),
        ArticleCategory.init(id: 3, title: "Politics"),
        ArticleCategory.init(id: 4, title: "Fshion"),
        ArticleCategory.init(id: 5, title: "Economics"),
        ArticleCategory.init(id: 6, title: "Cinema")
    ]
    @Published var selectedNewsCategories: [ArticleCategory] = []
    @Published var selectedCountry = Country(id: -1, name: "Choose one")
    @Published var showCountryError: Bool = false
    @Published var showNewsCategoryError: Bool = false
    @Published var shouldOpenHome : Bool = false


    func handleCategorySelection(index : Int){
        if selectedNewsCategories.contains(categories[index]){
            selectedNewsCategories.removeAll(where: { $0 == categories[index] })
        }else{
            if selectedNewsCategories.count != 3 {
                selectedNewsCategories.append(categories[index])
                showNewsCategoryError = false
            }
        }
    }
    
    func validate() -> Bool {
        var isValid = true
        if selectedNewsCategories.count == 0 {
            isValid = false
            showNewsCategoryError = true
        }
        if selectedCountry.id == -1 {
            isValid = false
            showCountryError = true
        }
        return isValid
    }
    
    func saveSelectedCountryAndCategories()  {
        DefaultsUtils.saveNewsCategories(newsCategories: selectedNewsCategories)
        DefaultsUtils.saveCountry(country: selectedCountry)
    }
    
    func submitAction() {
        if validate() {
            saveSelectedCountryAndCategories()
            shouldOpenHome.toggle()
        }
    }

    
}
