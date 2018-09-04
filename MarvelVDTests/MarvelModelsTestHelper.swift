//
//  MarvelModelsTestHelper.swift
//  MarvelVDTests
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
@testable import MarvelVD

final class MarvelModelsTestHelper {
    
    private let comicsOK = "{\"data\":{\"results\": [{\"id\": 183,\"title\": \"Startling Stories: The Incorrigible Hulk (2004) #1\", \"variantDescription\": \"\",\"description\": \"For Doctor Bruce Banner l\", \"thumbnail\": {\"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available\",\"extension\": \"jpg\"}}]}}"
    
    private let charactersOK = "{\"data\":{\"results\": [{\"id\": 1011334, \"name\": \"3-D Man\", \"description\": \"\", \"thumbnail\": { \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784\", \"extension\": \"jpg\"}}]}}"
    
    private let creatorsOK = "{\"data\": {\"results\": [{\"id\": 7968,\"firstName\": \"\",\"middleName\": \"\", \"lastName\": \"\", \"fullName\": \"\", \"thumbnail\": { \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available\", \"extension\": \"jpg\" }}]}}"
    
    private let eventsOK = "{\"data\": {\"results\": [{\"id\": 116,\"title\": \"Acts of Vengeance!\", \"description\": \"Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.\", \"thumbnail\": { \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b\", \"extension\": \"jpg\"}}]}}"
    
    private let seriesOK = "{  \"data\": {\"results\": [{\"id\": 18454, \"title\": \"100th Anniversary Special (2014)\", \"description\": null, \"thumbnail\": { \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available\", \"extension\": \"jpg\" }}]}}"
    
    private let storiesOK = "{\"data\": { \"results\": [{ \"id\": 7, \"title\": \"Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf\", \"description\": \"\", \"thumbnail\": null }]}}"
    
    private let error = "error"
    
    func returnErrorJson() -> Data {
        return Data(error.utf8)
    }
    
    func returnJSONToData(_ type: MarvelRequestSites) -> Data {
        switch type {
        case .characters:
            return Data(charactersOK.utf8)
        case .comics:
            return Data(comicsOK.utf8)
        case .creators:
            return Data(creatorsOK.utf8)
        case .events:
            return Data(eventsOK.utf8)
        case .series:
            return Data(seriesOK.utf8)
        case .stories:
            return Data(storiesOK.utf8)
        }
    }
    
}
