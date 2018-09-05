//
//  MainViewController.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    @IBAction func showItemList(_ sender: UIButton) {
        if let type = MarvelRequestSites.init(rawValue: (sender.titleLabel?.text?.lowercased())!) {
            performSegue(withIdentifier: "goToMarvelItemList", sender: type)
        } else {
            let alert = UIAlertController(title: "This option is not available", message: "You pressed a button that's not available.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMarvelItemList" {
            let destinationVController = segue.destination as! MarvelTableViewController
            destinationVController.type = sender as! MarvelRequestSites
        }
    }
}
