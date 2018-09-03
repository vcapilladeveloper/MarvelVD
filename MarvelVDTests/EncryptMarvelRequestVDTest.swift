//
//  EncryptMarvelRequestVDTest.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class EncryptMarvelRequestVDTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEncrypt_testTimestampEncryptURL() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let dataDate = dateFormatter.date(from: "10/10/1984 12:13:14")
        
        let encryptURL = EncryptMarvelRequestVD().encryptForRequestData("https://gateway.marvel.com:433/v1/public/", dataDate!)
        
        XCTAssertEqual(encryptURL.absoluteString, "https://gateway.marvel.com:433/v1/public/ts=626018515940000000&apiKey=9b517862812797cfee46ad75914c87f4&hash=e00929dfbf37fe536071841510a02a46")
    }
    
}
