//
//  MarvelItemCell.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

// Cell to show in the TableView from MarvelTableViewController,
// the information requested from API.
class MarvelItemCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageItem: AsyncImageView!
    
    // Control if the title comes empty from API to show a default
    // text instead of label with not text in the view.
    func configCellWithItem(_ item: MarvelItem) {
        idLabel.text = "\(item.id)"
        if item.title.isEmpty {
            titleLabel.text = "No Title"
        } else {
            titleLabel.text = item.title
        }
        imageItem.setURL(url: NSURL(string: item.imageUrl.absoluteString), placeholderImage: #imageLiteral(resourceName: "emptyImage_3x"))
    }
    
}
