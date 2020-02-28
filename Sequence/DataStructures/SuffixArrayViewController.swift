//
//  SuffixArrayViewController.swift
//  Sequence
//
//  Created by 7Winds on 28.02.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//
import UIKit

private enum SuffixArrayVCRow: Int {
    case creation = 0,
    creationWithAlgoNames,
    search10Random,
    search10RandomWithCondition,
    remove1Entry,
    remove5Entries,
    remove10Entries,
    lookup1Entry,
    lookup10Entries
}

class SuffixArrayViewController: DataStructuresViewController {
    
    let suffixArrayMinpulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    var creationTime: TimeInterval = 0
    var creationAlgoTime: TimeInterval = 0
    var search10Words: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: [])
        slider.isEnabled = false
    }
    
    override func create(_ size: Int) {
        creationTime = suffixArrayMinpulator.setupWithSize(size)
    }
    
    override func test() {
        if suffixArrayMinpulator.arrayHasObjects() {
            creationAlgoTime = suffixArrayMinpulator.setupWithObjects(items:Services.algoProvider.all, reverse:false)
            search10Words = suffixArrayMinpulator.searchRandomWords(count: 10, wordSize: 3)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch (indexPath as NSIndexPath).row {
        case SuffixArrayVCRow.creation.rawValue:
            cell.textLabel!.text = "Array Creation:"
            cell.detailTextLabel!.text = formattedTime(creationTime)
        case SuffixArrayVCRow.creationWithAlgoNames.rawValue:
            cell.textLabel!.text = "Creation with AlgoProvider:"
            cell.detailTextLabel!.text = formattedTime(creationAlgoTime)
        case SuffixArrayVCRow.search10Random.rawValue:
            cell.textLabel!.text = "Search 10 words:"
            cell.detailTextLabel!.text = formattedTime(search10Words)
        default:
            print("Unhandled row! \((indexPath as NSIndexPath).row)")
        }
        
        return cell
    }
}
