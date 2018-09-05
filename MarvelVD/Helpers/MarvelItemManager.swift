//
//  MarvelItemManager.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class MarvelItemManager {
    var marvelItems = [MarvelItem]()
    
    var count: Int { return marvelItems.count }
    
    func addItem(_ item: MarvelItem) {
        marvelItems.append(item)
    }
    
    func itemAtIndex(_ index: Int) -> MarvelItem {
        return marvelItems[index]
    }
    
    func removeAllItems() {
        marvelItems.removeAll()
    }
}
