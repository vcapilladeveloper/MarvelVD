//
//  MarvelComic.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct MarvelComic: Codable {
    let id: Int
    let title, variantDescription, description: String
    let thumbnail: Thumbnail
}
