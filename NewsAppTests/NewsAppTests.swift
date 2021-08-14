//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Amr Ahmed on 14/08/2021.
//

import XCTest

@testable import NewsApp

class NewsAppTests: XCTestCase {
    
    var emptyCountry : Country?
    var emptyCategories : [ArticleCategory]?
    var overSizedCategories : [ArticleCategory]?
    
    override func setUp() {
        super.setUp()
        emptyCountry = Country()
        emptyCountry?.id = -1
        emptyCategories = [ArticleCategory]()
        overSizedCategories = [ArticleCategory]()
        overSizedCategories?.append(ArticleCategory(id: 1, title: "test1"))
        overSizedCategories?.append(ArticleCategory(id: 2, title: "test2"))
        overSizedCategories?.append(ArticleCategory(id: 3, title: "test3"))
        overSizedCategories?.append(ArticleCategory(id: 4, title: "test4"))
    }
    
    func emptyCountryShouldReturnFalse() {
        XCTAssertFalse(ValidationUtils.isValidCountry(slectedCountry: emptyCountry!))
    }
    
    func emptyCategoriesShouldReturnFalse(){
        XCTAssertFalse(ValidationUtils.isValidCategoriesCount(selectedCategories: emptyCategories!))
    }
    
    func overSizedCategoriesShouldReturnFalse() {
        XCTAssertFalse(ValidationUtils.isValidCategoriesCount(selectedCategories: overSizedCategories!))
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNullCountryShouldReturnFalse(){
        
    }
    
}
