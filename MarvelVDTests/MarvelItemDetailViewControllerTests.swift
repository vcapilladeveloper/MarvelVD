//
//  MarvelItemDetailViewControllerTests.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Studiogenesis on 6/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class MarvelItemDetailViewControllerTests: XCTestCase {
    var sut: MarvelItemDetailViewController!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MarvelItemDetailViewController") as! MarvelItemDetailViewController
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMarvelItemDetail_idLableNotNil() {
        XCTAssertNotNil(sut.idLabel)
    }
    
    func testMarvelItemDetail_titleLableNotNil() {
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func testMarvelItemDetail_descriptionLableNotNil() {
        XCTAssertNotNil(sut.descriptionLabel)
    }
    
    func testMarvelItemDetail_imageNotNil() {
        XCTAssertNotNil(sut.itemImage)
    }
    
    func testMarvelItemDetail_checkIdLabel() {
        let marvelItem = MarvelItem(id: 123, title: "", description: "", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.idLabel.text, "ID: 123")
    }
    
    func testMarvelItemDetail_checkTitleLabelEmpty() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.titleLabel.text, "No Title")
    }
    
    func testMarvelItemDetail_checkTitleLabel() {
        let marvelItem = MarvelItem(id: 0, title: "Testing Title", description: "", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.titleLabel.text, "Title: Testing Title")
    }
    
    func testMarvelItemDetail_checkDescriptionLabelEmpty() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.descriptionLabel.text, "No Description")
    }
    
    func testMarvelItemDetail_checkDescriptionLabel() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "Testing Description", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.descriptionLabel.text, "Description: Testing Description")
    }
    
    func testMarvelItemDetail_checkImageBadURL() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "", imageUrl: URL(string: "http://www.apple.com")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.itemImage.image, #imageLiteral(resourceName: "emptyImage_3x"))
    }
    
    func testMarvelItemDetail_checkImage() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "", imageUrl: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!)
        sut.marvelItem = marvelItem
        sut.loadViewContent()
        XCTAssertEqual(sut.itemImage.url?.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
        
        
    }
    
}
