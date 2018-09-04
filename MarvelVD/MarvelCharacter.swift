//
//  File.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct MarvelCharacter: Codable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
}

extension MarvelCharacter: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id, title: name, description: description, imageUrl: thumbnail.returnUrl())
    }
}
