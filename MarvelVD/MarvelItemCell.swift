//
//  MarvelItemCell.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

class MarvelItemCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageItem: AsyncImageView!
    
    
    func configCellWithItem(_ item: MarvelItem) {
//        idLabel.text = "\(item.id)"
//        titleLabel.text = item.title
//        imageItem.setURL(url: item.imageUrl, placeholderImage: #imageLiteral(resourceName: "emptyImage_3x"))
    }
    
}
