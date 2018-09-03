//
//  MarvelCollectionRequest.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class MarvelCollectionRequest {
    
    func getCharacters() {
        RequestManager.getResult(MarvelRequestSites.characters.getUrlForSearch()) { (data, error) in
            if error {
                print("Error Requesting Data")
            } else {
                if let characters: BaseModel<ResultModel<[MarvelCharacter]>> = ModelCodableEngineVD().genericConvert(data as! Data) {
                    for char in characters.data.results {
                        print("Name: ", char.name)
                        print("Description: ", char.description)
                    }
                }
            }
        }
    }
}
