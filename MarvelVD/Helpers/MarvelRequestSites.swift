//
//  MarvelRequestSites.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Enum for help to get each API URL depending what we want to get.
enum MarvelRequestSites: String {
    private var domainUrl: String { return "https://gateway.marvel.com:443/v1/public/" }
    case characters
    case comics
    case creators
    case events
    case series
    case stories
    
    private func getUrl() -> String {
        return domainUrl + self.rawValue + "?limit=50"
    }
    
    func getUrlForSearch(_ startWith: String? = nil) -> String {
        var baseUrl = self.getUrl()
        if let startWithCharacters = startWith {
            switch self {
            case .characters, .creators, .events:
                baseUrl += "&nameStartsWith=\(startWithCharacters)"
            case .comics, .series:
                baseUrl += "&titleStartsWith=\(startWithCharacters)"
            default:
                print("Without title")
            }
            
        }
        return baseUrl
    }
    
}
