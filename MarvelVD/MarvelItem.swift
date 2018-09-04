//
//  MarvelItem.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

protocol MarvelItemData {
    func returnMarvelItem()->MarvelItem
}

struct MarvelItem {
    let id: Int
    let title, description: String
    let imageUrl: URL
}
