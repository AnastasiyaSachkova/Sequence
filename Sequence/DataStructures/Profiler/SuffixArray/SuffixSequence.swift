//
//  SuffixSequence.swift
//  Sequence
//
//  Created by 7Winds on 28.02.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
struct SuffixSequence: Sequence {
    let string:String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}


struct SuffixIterator: IteratorProtocol {
    
    let string:String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else {
            return nil
        }
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}
