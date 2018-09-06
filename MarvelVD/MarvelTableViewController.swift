//
//  MarvelTableViewController.swift
//  MarvelVD
//
//  Created by Victor Capilla Studiogenesis on 5/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

// View Controller where is the Table View to show the results of Request
// data from API
final class MarvelTableViewController: UIViewController {
    
    // Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & MarvelItemListDataProvider)!
    @IBOutlet weak var searchBar: UISearchBar!
    var type: MarvelRequestSites!
    var marvelItemsManager: MarvelItemManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        searchBar.delegate = self
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showDetails(sender:)),
            name: NSNotification.Name("MarvelItemSelectedNotification"),
            object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        marvelItemsManager = MarvelItemManager()
        dataProvider.marvelItemsManager = marvelItemsManager
        self.title = type.rawValue.capitalized
        getData()
    }
    
    
    // Observer reaction to show the details of the item selected from TableView
    @objc func showDetails(sender: NSNotification) {
        guard let index = sender.userInfo?["index"] as? MarvelItem else
        { fatalError() }
        
        performSegue(withIdentifier: "goToDetail", sender: index)
    }
    
    // Prepare the transaction to show the information of the MarvelItem selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! MarvelItemDetailViewController
            if let item = sender as? MarvelItem {
                destinationVC.marvelItem = item
            }
        }
    }

    // Perform the query according to the option selected in MainviewController and
    // if a search has been performed, with the text of the search.
    private func getData(_ search: String? = nil) {
        switch type! {
        case .characters:
            self.pleaseWait()
            MarvelCollectionRequest().getCharacters(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        case .comics:
            self.pleaseWait()
            MarvelCollectionRequest().getComics(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        case .creators:
            self.pleaseWait()
            MarvelCollectionRequest().getCreators(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        case .events:
            self.pleaseWait()
            MarvelCollectionRequest().getEvents(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        case .stories:
            self.pleaseWait()
            MarvelCollectionRequest().getStories(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        case .series:
            self.pleaseWait()
            MarvelCollectionRequest().getSeries(search) { (data, error) in
                self.evaluateInformationRequest(data, error)
            }
        }
    }
    
    // Check if the information recived cam be used like MarvelItem collection.
    private func evaluateInformationRequest(_ data: [MarvelItem]?, _ error: Bool) {
        DispatchQueue.main.async {
            if !error {
                self.dataProvider.addItemsToList(data!)
                self.tableView.reloadData()
                self.clearAllNotice()
            } else {
                self.showAlert()
            }
        }
    }
    
    private func showAlert() {
        self.clearAllNotice()
        let alert = UIAlertController(title: "Unavailable Data",
                                      message: "Is not possible to load data.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension MarvelTableViewController: UISearchBarDelegate {
    // Gets the text from searchBar and make the request when the Search button in keyboard is pressed.
    // If the text is empty, does it an empty search to get all resoults.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text != "" {
            getData(text)
        } else {
            getData()
        }
    }
}
