//
//  MarvelTableViewControllerTests.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class MarvelTableViewControllerTests: XCTestCase {
    
    var sut: MarvelTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MarvelTableViewController") as! MarvelTableViewController
        
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMarvelTableViewController_tableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testMarvelTableViewController_shouldSetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is MarvelItemListDataProvider)
    }
    
    func testMarvelTableViewController_shouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is MarvelItemListDataProvider)
    }
    
    func testMarvelTableViewController_dataSorceAndDelegateBeTheSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? MarvelItemListDataProvider, sut.tableView.delegate as? MarvelItemListDataProvider)
    }
}
