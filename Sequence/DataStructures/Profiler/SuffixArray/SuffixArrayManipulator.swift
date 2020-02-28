//
//  SuffixArrayManipulator.swift
//  Sequence
//
//  Created by 7Winds on 28.02.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func arrayHasObjects() -> Bool
    func setupWithSize(_ size: Int) -> TimeInterval
    func setupWithObjects(items: [String], reverse: Bool) -> TimeInterval
    func searchRandomWords(count: Int, wordSize: Int) -> TimeInterval
    func searchAlgoName(query: String) -> [String]
}
