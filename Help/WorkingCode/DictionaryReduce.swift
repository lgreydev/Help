//
//  DictionaryReduce.swift
//  Help
//
//  Created by Sergey Lukaschuk on 25.06.2021.
//

import Foundation


// MARK:  Dictionary Reduce


let fruits = ["🍏", "🍓", "🍒", "🍌", "🍏", "🍒", "🍌", "🍌", "🍌", "🍒", "🍒", "🍌", "🍓", "🍓"]

let fruitsCount = fruits.reduce(into: [:]) { counts, fruit in
    counts[fruit, default: 0] += 1
}

// fruitsCount
// ["🍒": 4, "🍏": 2, "🍓": 3, "🍌": 5]
// [String : Int]
