//
//  MarvelItemCellTests.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Studiogenesis on 6/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class MarvelItemCellTests: XCTestCase {
    
    var tableView: UITableView!
    var dataSource = FakeDataSource()
    var cell: MarvelItemCell!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MarvelTableViewController") as! MarvelTableViewController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        tableView.dataSource = dataSource
        cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! MarvelItemCell
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMarvelItemCell_HasIdLabel() {
        XCTAssertTrue(cell.idLabel.isDescendant(of: cell.contentView))
    }
    
    func testMarvelItemCell_HasTitleLabel() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func testMarvelItemCell_HasDescriptionLabel() {
        XCTAssertTrue(cell.imageItem.isDescendant(of: cell.contentView))
    }
    
    func testMarvelItemCell_EmptyTitle() {
        let marvelItem = MarvelItem(id: 0, title: "", description: "Test Desc", imageUrl: URL(string: "http://www.google.com")!)
        cell.configCellWithItem(marvelItem)
        XCTAssertEqual(cell.titleLabel.text, "No Title")
    }
    
    func testMarvelItemCell_TestTitleContent() {
        let marvelItem = MarvelItem(id: 0, title: "Test Title", description: "", imageUrl: URL(string: "http://www.google.com")!)
        cell.configCellWithItem(marvelItem)
        XCTAssertEqual(cell.titleLabel?.text, "Test Title")
    }
    
    func testMarvelItemCell_TestImageURL() {
        let marvelItem = MarvelItem(id: 0, title: "Test Title", description: "Test Desc", imageUrl: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!)
        cell.configCellWithItem(marvelItem)
        XCTAssertEqual(cell.imageItem.url?.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
    }
}

extension MarvelItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
