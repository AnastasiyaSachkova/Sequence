//
//  Services.swift
//  Sequence
//
//  Created by 7Winds on 28.02.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation

class Services {
    static var feedProvider: FeedDataProvider = {
        return FeedDataProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
}
