//
//  BaseModel.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Base and result to get with codable the data from requests.
// Use of Generics to reuse this structs for all requests results.
struct BaseModel<T: Codable>: Codable {
    let data: T
}

struct ResultModel<T: Codable>: Codable {
    let results: T
}
