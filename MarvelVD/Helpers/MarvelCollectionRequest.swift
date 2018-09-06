//
//  MarvelCollectionRequest.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// From this class, we can make all request to get the info that we need.
// TODO: Try to refactor in only one method instead of have 1 method for each API call.
final class MarvelCollectionRequest {
    typealias GetMarvelCollectionResult = (_ data: [MarvelItem]?, _ error: Bool) -> Void
    
    func getCharacters(_ search: String? = nil, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult( MarvelRequestSites.characters.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
    
    func getComics(_ search: String?, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult(MarvelRequestSites.comics.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelComic]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
    
    func getEvents(_ search: String?, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult(MarvelRequestSites.events.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelEvent]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
    
    func getCreators(_ search: String?, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult(MarvelRequestSites.creators.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelCreator]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
    
    func getSeries(_ search: String?, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult(MarvelRequestSites.series.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelSerie]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
    
    func getStories(_ search: String?, _ handleResult: @escaping GetMarvelCollectionResult) {
        RequestManager.getResult(MarvelRequestSites.stories.getUrlForSearch(search)) { (data, error) in
            if error {
                handleResult(nil, error)
            } else {
                if let characters: BaseModel<ResultModel<[MarvelStory]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    var marvelItems = [MarvelItem]()
                    for char in characters.data.results {
                        marvelItems.append(char.returnMarvelItem())
                    }
                    handleResult(marvelItems, error)
                } else {
                    handleResult(nil, true)
                }
            }
        }
    }
}
