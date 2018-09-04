//
//  MarvelEvent.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct MarvelEvent: Codable {
    let id: Int
    let title, description: String
    let thumbnail: Thumbnail
}

extension MarvelEvent: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id, title: title, description: description, imageUrl: thumbnail.returnUrl())
    }
}
