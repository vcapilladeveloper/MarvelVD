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
            let character = characters.data.results[0]
            XCTAssertEqual(character.id, 1011334)
            XCTAssertEqual(character.name, "3-D Man")
            XCTAssertEqual(character.description, "")
            XCTAssertEqual(character.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
            XCTAssertEqual(character.thumbnail.thumbnailExtension, Extension.jpg)
            
            
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_comicOK() {
        
        if let comics: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.comics)) {
            let comic = comics.data.results[0]
            XCTAssertEqual(comic.id, 183)
            XCTAssertEqual(comic.title, "Startling Stories: The Incorrigible Hulk (2004) #1")
            XCTAssertEqual(comic.description, "For Doctor Bruce Banner l")
            XCTAssertEqual(comic.variantDescription, "")
            XCTAssertEqual(comic.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
            XCTAssertEqual(comic.thumbnail.thumbnailExtension, Extension.jpg)
            
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_creatorsOK() {
        if let creators: BaseModel<ResultModel<[MarvelCreator]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.creators)) {
            let creator = creators.data.results[0]
            XCTAssertEqual(creator.id, 7968)
            XCTAssertEqual(creator.firstName, "")
            XCTAssertEqual(creator.middleName, "")
            XCTAssertEqual(creator.lastName, "")
            XCTAssertEqual(creator.fullName, "")
            XCTAssertEqual(creator.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
            XCTAssertEqual(creator.thumbnail.thumbnailExtension, Extension.jpg)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_eventsOK() {
        if let events: BaseModel<ResultModel<[MarvelEvent]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.events)) {
            let event = events.data.results[0]
            XCTAssertEqual(event.id, 116)
            XCTAssertEqual(event.title, "Acts of Vengeance!")
            XCTAssertEqual(event.description, "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.")
            XCTAssertEqual(event.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b")
            XCTAssertEqual(event.thumbnail.thumbnailExtension, Extension.jpg)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_seriesOK() {
        if let series: BaseModel<ResultModel<[MarvelSerie]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.series)) {
            let serie = series.data.results[0]
            XCTAssertEqual(serie.id, 18454)
            XCTAssertEqual(serie.title, "100th Anniversary Special (2014)")
            XCTAssertNil(serie.description)
            XCTAssertEqual(serie.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
            XCTAssertEqual(serie.thumbnail.thumbnailExtension, Extension.jpg)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_storiesOK() {
        if let stories: BaseModel<ResultModel<[MarvelStory]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.stories)) {
            let story = stories.data.results[0]
            XCTAssertEqual(story.id, 7)
            XCTAssertEqual(story.title, "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf")
            XCTAssertEqual(story.description, "")
            XCTAssertNil(story.thumbnail)
            
        } else {
            XCTAssertTrue(false)
        }
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
        if let creators: BaseModel<ResultModel<[MarvelCreator]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(creators)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_eventsError() {
        if let events: BaseModel<ResultModel<[MarvelEvent]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(events)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_seriesError() {
        if let series: BaseModel<ResultModel<[MarvelSerie]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(series)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_storiesError() {
        if let stories: BaseModel<ResultModel<[MarvelStory]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnErrorJson()){
            XCTAssertNil(stories)
        } else {
            XCTAssertTrue(true)
        }
    }
    
    func testModels_characterToMarvelItem() {
        if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.characters)) {
            let marvelItem = characters.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 1011334)
            XCTAssertEqual(marvelItem.title, "3-D Man")
            XCTAssertEqual(marvelItem.description, "")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_comicToMarvelItem() {
        
        if let comics: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.comics)) {
            let marvelItem = comics.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 183)
            XCTAssertEqual(marvelItem.title, "Startling Stories: The Incorrigible Hulk (2004) #1")
            XCTAssertEqual(marvelItem.description, "For Doctor Bruce Banner l")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_creatorToMarvelItem() {
        if let creators: BaseModel<ResultModel<[MarvelCreator]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.creators)) {
            let marvelItem = creators.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 7968)
            XCTAssertEqual(marvelItem.title, "")
            XCTAssertEqual(marvelItem.description, "  ")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_eventToMarvelItem() {
        if let events: BaseModel<ResultModel<[MarvelEvent]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.events)) {
            let marvelItem = events.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 116)
            XCTAssertEqual(marvelItem.title, "Acts of Vengeance!")
            XCTAssertEqual(marvelItem.description, "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b.jpg")
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_serieToMarvelItem() {
        if let series: BaseModel<ResultModel<[MarvelSerie]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.series)){
            let marvelItem = series.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 18454)
            XCTAssertEqual(marvelItem.title, "100th Anniversary Special (2014)")
            XCTAssertEqual(marvelItem.description, "No description")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testModels_storyToMarvelItem() {
        if let stories: BaseModel<ResultModel<[MarvelStory]>> = ModelCodableEngineVD().genericConvert(MarvelModelsTestHelper().returnJSONToData(.stories)) {
            let marvelItem = stories.data.results[0].returnMarvelItem()
            XCTAssertEqual(marvelItem.id, 7)
            XCTAssertEqual(marvelItem.title, "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf")
            XCTAssertEqual(marvelItem.description, "")
            XCTAssertEqual(marvelItem.imageUrl.absoluteString, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")
            
        } else {
            XCTAssertTrue(false)
        }
    }
}
