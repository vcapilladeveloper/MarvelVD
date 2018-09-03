//
//  RequestManagerTest.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class RequestManagerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testRequestManager_classExists() {
        // This is an example of a functional test case.
        
        let requestManager = RequestManager()
        
        XCTAssertNotNil(requestManager)
    }
    
    func test_get_request_withIncorectURL() {
        guard let url = URL(string: "http://www.google./") else {
            fatalError("URL can't be empty")
        }
        let expectation: XCTestExpectation = self.expectation(description: "GET DATA")
        RequestManager.getResult(url) { (data, error) in
            if !error {
                XCTAssertNotNil(data)
                expectation.fulfill()
                
            } else {
                XCTAssertTrue(error)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error: Error?) in
            XCTAssertFalse(false, (error?.localizedDescription)!)
        }
    }
    
    func test_get_request_URLWithoutInfo() {
        guard let url = URL(string: "http://gateway.marvel.com/") else {
            fatalError("URL can't be empty")
        }
        let expectation: XCTestExpectation = self.expectation(description: "GET DATA")
        RequestManager.getResult(url) { (data, error) in
            if !error {
                XCTAssertNotNil(data)
                expectation.fulfill()
                
            } else {
                XCTAssertTrue(error)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error: Error?) in
            XCTAssertFalse(false, (error?.localizedDescription)!)
        }
    }
    
}
