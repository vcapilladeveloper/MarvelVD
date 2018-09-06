//
//  MarvelItemListDataProvider.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

// This is the dataSource and Delegate for the MarvelTableViewController
// with a MarvelItemManager who take cares of show and interact
// with the data requested from API.
final class MarvelItemListDataProvider: NSObject {
    var marvelItemsManager: MarvelItemManager?
}

extension MarvelItemListDataProvider: UITableViewDataSource, UITableViewDelegate {
    
    func addItemsToList(_ items: [MarvelItem]) {
        marvelItemsManager?.addItems(items)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return marvelItemsManager?.marvelItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! MarvelItemCell

        cell.configCellWithItem((marvelItemsManager?.marvelItems[indexPath.row])!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = marvelItemsManager?.itemAtIndex(indexPath.row) {
        NotificationCenter.default.post(
            name: NSNotification.Name("MarvelItemSelectedNotification"),
            object: self,
            userInfo: ["index": item])
        }
    }
}
