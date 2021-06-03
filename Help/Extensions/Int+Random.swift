//
//  Int+Random.swift
//  Help
//
//  Created by Sergey Lukaschuk on 02.06.2021.
//

import Foundation


// MARK: Int + Random
/// An extension for Int that returns a random number works with range  of numbers. Negative numbers converts to positive.
/// Example: 17.random will return 0 to 17 (not including 17)
/// Example: -5.random, -5 convert to 5, will return 0 to 5 (not including 5).

extension Int {
    var random: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}






