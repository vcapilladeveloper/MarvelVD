//
//  MarvelStory.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Model for Story data.
struct MarvelStory: Codable {
    let id: Int
    let title, description: String
    let thumbnail: Thumbnail?
}

extension MarvelStory: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id, title: title, description: description, imageUrl: thumbnail != nil ? thumbnail!.returnUrl() : URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")!)
    }
}
