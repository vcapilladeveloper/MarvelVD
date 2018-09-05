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
    
}
