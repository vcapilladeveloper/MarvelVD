//
//  MarvelItemListDataProviderTests.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class MarvelItemListDataProviderTests: XCTestCase {
    
    var sut: MarvelItemListDataProvider!
    var tableView: UITableView!
    var controller: MarvelTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MarvelItemListDataProvider()
        sut.marvelItemsManager = MarvelItemManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "MarvelTableViewController") as! MarvelTableViewController
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView.dataSource = sut
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMarvelItemList_sectionIsOne() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testMarvelItemList_sectionRowsAreManageItemsCount() {
        sut.marvelItemsManager?.addItem(MarvelItem(id: 1, title: "Hi title", description: "Hi description", imageUrl: URL(string: "http://www.github.com")!))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.marvelItemsManager?.addItem(MarvelItem(id: 2, title: "Hi second Title", description: "Hi second description", imageUrl: URL(string: "http://www.google.com")!))
        
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRow_ReturnsMarvelItemCell() {
        sut.marvelItemsManager?.addItem(MarvelItem(id: 0, title: "", description: "", imageUrl: URL(string: "htto://www.gitlab.com")!))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(item: 0, section: 0))
        
        XCTAssertTrue(cell is MarvelItemCell)
    }
    
    func testCellForRow_DequeueCell() {
        let mockTableView = MockTableView()
        
        mockTableView.dataSource = sut
        mockTableView.register(MarvelItemCell.self, forCellReuseIdentifier: "ItemCell")
        sut.marvelItemsManager?.addItem(MarvelItem(id: 3, title: "", description: "", imageUrl: URL(string: "http://www.linkedin.com")!))
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testCellInSection_getConfiguredWithDoneItem() {
        let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        
        let firstItem = MarvelItem(id: 1, title: "One", description: "First", imageUrl: URL(string: "http://www.appcoda.com")!)
        sut.marvelItemsManager?.addItem(firstItem)
        let secondItem = MarvelItem(id: 2, title: "Two", description: "Second", imageUrl: URL(string: "http://www.raywenderlich.com")!)
        sut.marvelItemsManager?.addItem(secondItem)
        mockTableView.reloadData()
        
        
        let cell = mockTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as! MockMarvelItemCell
        
        //XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
        
        XCTAssertEqual(cell.itemCell, secondItem)
    }
    
}

extension MarvelItemListDataProviderTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func mockTableViewWithDataSource(_ dataSource: UITableViewDataSource) -> MockTableView {
            
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                                              style: .plain)
            
            mockTableView.dataSource = dataSource
            
            mockTableView.register(MockMarvelItemCell.self,
                                   forCellReuseIdentifier: "ItemCell")
            return mockTableView
        }
    }
    
    class MockMarvelItemCell: MarvelItemCell {
        var itemCell: MarvelItem?
        
        override func configCellWithItem(_ item: MarvelItem) {
            itemCell = item
        }
    }
}
