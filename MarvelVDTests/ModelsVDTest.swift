//
//  ModelsVDTest.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class ModelsVDTest: XCTestCase {
    
    let jsonCharacters = "{\"data\":{\"results\": [{\"id\": 1011334, \"name\": \"3-D Man\", \"description\": \"\", \"thumbnail\": { \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784\", \"extension\": \"jpg\"}}]}}"
    let jsonComic = "{\"data\":{\"results\": [{\"id\": 183,\"title\": \"Startling Stories: The Incorrigible Hulk (2004) #1\", \"variantDescription\": \"\",\"description\": \"For Doctor Bruce Banner life is anything but normal. But what happens when two women get between him and his alter ego, the Incorrigible Hulk? Hulk confused! \r\nIndy superstar Peter Bagge (THE MEGALOMANIACAL SPIDER-MAN) takes a satirical jab at the Hulk mythos\", \"thumbnail\": {\"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available\",\"extension\": \"jpg\"}"
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModels_characters() {
        let data = Data(jsonCharacters.utf8)
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(data) {
            XCTAssertEqual(characters.data.results[0].id, 1011334)
            XCTAssertEqual(characters.data.results[0].name, "3-D Man")
            XCTAssertEqual(characters.data.results[0].description, "")
            XCTAssertEqual(characters.data.results[0].thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
            XCTAssertEqual(characters.data.results[0].thumbnail.thumbnailExtension, Extension.jpg)
            
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_comic() {
        let data = Data(jsonComic.utf8)
        
        if let comics: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(data) {
            XCTAssertEqual(comics.data.results[0].id, 183)
            XCTAssertEqual(comics.data.results[0].title, "Startling Stories: The Incorrigible Hulk (2004) #1")
            XCTAssertEqual(comics.data.results[0].description, "Startling Stories: The Incorrigible Hulk (2004) #1\", \"variantDescription\": \"\",\"description\": \"For Doctor Bruce Banner life is anything but normal. But what happens when two women get between him and his alter ego, the Incorrigible Hulk? Hulk confused! \r\nIndy superstar Peter Bagge (THE MEGALOMANIACAL SPIDER-MAN) takes a satirical jab at the Hulk mythos")
            XCTAssertEqual(comics.data.results[0].variantDescription, "")
            XCTAssertEqual(comics.data.results[0].thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
            XCTAssertEqual(comics.data.results[0].thumbnail.thumbnailExtension, Extension.jpg)
        } else {
            XCTAssertTrue(false)
        }
    }
    
}
