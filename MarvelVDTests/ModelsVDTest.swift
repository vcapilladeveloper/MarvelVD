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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModels_charactersOK() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.characters)) {
            XCTAssertEqual(characters.data.results[0].id, 1011334)
            XCTAssertEqual(characters.data.results[0].name, "3-D Man")
            XCTAssertEqual(characters.data.results[0].description, "")
            XCTAssertEqual(characters.data.results[0].thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
            XCTAssertEqual(characters.data.results[0].thumbnail.thumbnailExtension, Extension.jpg)
            
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_comicOK() {
        
        if let comics: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.comics)) {
            XCTAssertEqual(comics.data.results[0].id, 183)
            XCTAssertEqual(comics.data.results[0].title, "Startling Stories: The Incorrigible Hulk (2004) #1")
            XCTAssertEqual(comics.data.results[0].description, "For Doctor Bruce Banner l")
            XCTAssertEqual(comics.data.results[0].variantDescription, "")
            XCTAssertEqual(comics.data.results[0].thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
            XCTAssertEqual(comics.data.results[0].thumbnail.thumbnailExtension, Extension.jpg)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_creatorsOK() {
        
    }
    
    func testModels_eventsOK() {
        
    }
    
    func testModels_seriesOK() {
        
    }
    
    func testModels_storiesOK() {
        
    }
    
    func testModels_charactersError() {
    
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(characters)
        } else {
            XCTAssertTrue(true)
        }
        
    }
    
    func testModels_comicError() {
        if let comics: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(comics)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_creatorsError() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertTrue(false)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_eventsError() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertTrue(false)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_seriesError() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertTrue(false)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_storiesError() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertTrue(false)
        } else {
            XCTAssertTrue(true)
        }
    }
}
