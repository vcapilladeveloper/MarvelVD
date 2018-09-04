//
//  MarvelCreator.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct MarvelCreator: Codable {
    let id: Int
    let firstName, middleName, lastName, fullName: String
    let thumbnail: Thumbnail
    
    func returnDescription() -> String {
        return firstName + " " + middleName + " " + lastName
    }
}

extension MarvelCreator: MarvelItemData {
    func returnMarvelItem() -> MarvelItem {
        return MarvelItem(id: id, title: fullName, description: returnDescription() , imageUrl: thumbnail.returnUrl())
    }
}
