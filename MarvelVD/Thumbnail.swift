//
//  Thumbnail.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    func returnUrl() -> URL {
        if let url = URL(string: path + thumbnailExtension.rawValue) {
            return url
        } else {
            return URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")!
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
