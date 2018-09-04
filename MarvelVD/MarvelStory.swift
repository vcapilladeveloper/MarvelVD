//
//  MarvelStory.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct MarvelStory: Codable {
    let id: Int
    let title, description: String
    let thumbnail: Thumbnail
}

extension MarvelStory: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id, title: title, description: description, imageUrl: thumbnail.returnUrl())
    }
}
