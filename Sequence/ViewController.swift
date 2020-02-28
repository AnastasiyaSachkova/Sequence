//
//  ViewController.swift
//  Sequence
//
//  Created by 7Winds on 28.02.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    private var dataItems:[String] = Services.feedProvider.feedData()
    private var filteterdDataItems:[String] = []
    
    private var isSearchBarEmpty: Bool {
        guard let query = searchController.searchBar.text else {
            return true
        }
        return query.isEmpty
    }
    
    private var isFiltered: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        initSearching()
    }
    
    private func initSearching() {
        dataItems.append(contentsOf: Services.algoProvider.all)
        let time = suffixArrayManipulator.setupWithObjects(items:dataItems, reverse:true)
        print("freeze time \(time)")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteterdDataItems.count : dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = isFiltered ? filteterdDataItems[indexPath.row] : dataItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
        let name = dataItems[indexPath.row]
        var viewController:UIViewController?
        
        switch name {
        case "Array":
            viewController = storyboard.instantiateViewController(withIdentifier: "ArrayViewController")
        case "Set":
            viewController = storyboard.instantiateViewController(withIdentifier: "SetViewController")
        case "Dictionary":
            viewController = storyboard.instantiateViewController(withIdentifier: "DictionaryViewController")
        case "SuffixArray":
            viewController = storyboard.instantiateViewController(withIdentifier: "SuffixArrayViewController")
        default: break
            
        }
        
        if let pushViewController = viewController {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query: String = searchController.searchBar.text else {
            return
        }
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        tableView.reloadData()
    }
}
