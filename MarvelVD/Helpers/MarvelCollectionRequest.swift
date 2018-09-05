//
//  MarvelCollectionRequest.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class MarvelCollectionRequest {
    typealias getMarvelCollectionResult = (_ data: [MarvelItem]?, _ error: Bool) -> Void
    
    func getCharacters(_ search: String? = nil, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
    
    func getComics(_ search: String?, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
    
    func getEvents(_ search: String?, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
    
    func getCreators(_ search: String?, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
    
    func getSeries(_ search: String?, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
    
    func getStories(_ search: String?, _ handleResult: @escaping getMarvelCollectionResult) {
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
                }
            }
        }
    }
}
