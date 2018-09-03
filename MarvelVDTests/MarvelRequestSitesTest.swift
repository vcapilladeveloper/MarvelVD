//
//  MarvelRequestSitesTest.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import MarvelVD

class MarvelRequestSitesTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMarvelVD_getURLWithoutSearch() {
        let charactersURL = MarvelRequestSites.characters.getUrlForSearch()
        let comicsURL = MarvelRequestSites.comics.getUrlForSearch()
        let creatorsURL = MarvelRequestSites.creators.getUrlForSearch()
        let eventsURL = MarvelRequestSites.events.getUrlForSearch()
        let seriesURL = MarvelRequestSites.series.getUrlForSearch()
        let storiesURL = MarvelRequestSites.stories.getUrlForSearch()
        
        XCTAssertEqual(charactersURL, "https://gateway.marvel.com:443/v1/public/characters?limit=50")
        XCTAssertEqual(comicsURL, "https://gateway.marvel.com:443/v1/public/comics?limit=50")
        XCTAssertEqual(creatorsURL, "https://gateway.marvel.com:443/v1/public/creators?limit=50")
        XCTAssertEqual(eventsURL, "https://gateway.marvel.com:443/v1/public/events?limit=50")
        XCTAssertEqual(seriesURL, "https://gateway.marvel.com:443/v1/public/series?limit=50")
        XCTAssertEqual(storiesURL, "https://gateway.marvel.com:443/v1/public/stories?limit=50")
    }
    
    func testMarvelVD_getURLWithSearch() {
        let charactersURL = MarvelRequestSites.characters.getUrlForSearch("spider")
        let comicsURL = MarvelRequestSites.comics.getUrlForSearch("batm")
        let creatorsURL = MarvelRequestSites.creators.getUrlForSearch("aco")
        let eventsURL = MarvelRequestSites.events.getUrlForSearch("All-New")
        let seriesURL = MarvelRequestSites.series.getUrlForSearch("Witch")
        let storiesURL = MarvelRequestSites.stories.getUrlForSearch("ew York City")
        
        XCTAssertEqual(charactersURL, "https://gateway.marvel.com:443/v1/public/characters?limit=50&nameStartsWith=spider")
        XCTAssertEqual(comicsURL, "https://gateway.marvel.com:443/v1/public/comics?limit=50&titleStartsWith=batm")
        XCTAssertEqual(creatorsURL, "https://gateway.marvel.com:443/v1/public/creators?limit=50&nameStartsWith=aco")
        XCTAssertEqual(eventsURL, "https://gateway.marvel.com:443/v1/public/events?limit=50&nameStartsWith=All-New")
        XCTAssertEqual(seriesURL, "https://gateway.marvel.com:443/v1/public/series?limit=50&titleStartsWith=Witch")
        XCTAssertEqual(storiesURL, "https://gateway.marvel.com:443/v1/public/stories?limit=50")
        
    }
}
