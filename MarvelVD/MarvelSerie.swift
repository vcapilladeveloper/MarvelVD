//
//  MarvelSerie.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Model for serie data.
struct MarvelSerie: Codable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}

extension MarvelSerie: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id,
                          title: title,
                          description: description ?? "No description", imageUrl: thumbnail.returnUrl())
    }
}
