//
//  MarvelItem.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 4/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Protocol to implement in Marvel items models for get a MarvelItem reference of it.
protocol MarvelItemData {
    func returnMarvelItem()->MarvelItem
}

// Model to use in the list and detail view of selected item
struct MarvelItem: Equatable {
    
    static func == (lhs: MarvelItem, rhs: MarvelItem ) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        
        if lhs.description != rhs.description {
            return false
        }
        
        if lhs.title != rhs.title {
            return false
        }
        
        if lhs.imageUrl.absoluteString != rhs.imageUrl.absoluteString {
            return false
        }
        return true
    }
    
    let id: Int
    let title, description: String
    let imageUrl: URL
}
