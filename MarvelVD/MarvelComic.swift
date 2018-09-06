//
//  MarvelComic.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Model for Comic data.
struct MarvelComic: Codable {
    let id: Int
    let title, variantDescription: String
    let description: String?
    let thumbnail: Thumbnail
}

extension MarvelComic: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id,
                          title: title,
                          description: description != nil ? description! : variantDescription,
                          imageUrl: thumbnail.returnUrl())
    }
}
