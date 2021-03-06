//
//  MarvelItemDetailViewController.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

// View Conontroller where we show the information of the item selected from TableView to the user.
// Control if Title or description are empty to prevent empty Label on the view.
final class MarvelItemDetailViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var itemImage: AsyncImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var marvelItem: MarvelItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewContent()
    }
    
    func loadViewContent() {
        if let item = marvelItem {
            idLabel.text = "ID: \(item.id)"
            itemImage.setURL(url: NSURL(string: item.imageUrl.absoluteString), placeholderImage: #imageLiteral(resourceName: "emptyImage_3x"))
            if item.title.isEmpty {
                titleLabel.text = "No Title"
            } else {
                titleLabel.text = "Title: \(item.title)"
            }
            
            if item.description.isEmpty {
                descriptionLabel.text = "No Description"
            } else {
                descriptionLabel.text = "Description: \(item.description)"
            }
        }
    }
}
