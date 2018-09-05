//
//  MarvelItemListDataProvider.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

final class MarvelItemListDataProvider: NSObject {
    var marvelItemsManager: MarvelItemManager?
}

extension MarvelItemListDataProvider: UITableViewDataSource {
    
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
}
