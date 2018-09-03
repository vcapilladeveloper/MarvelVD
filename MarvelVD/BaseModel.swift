//
//  BaseModel.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let data: T
}

struct ResultModel<T: Codable>: Codable {
    let result: T
}
