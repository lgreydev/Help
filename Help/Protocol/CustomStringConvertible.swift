//
//  CustomStringConvertible.swift
//  Help
//
//  Created by Sergey Lukaschuk on 02.06.2021.
//

import Foundation


// MARK: - Custom String Convertible
/// A type with a customized textual representation.
/// Types that conform to the CustomStringConvertible protocol can provide their own representation to be used when converting an instance to a string. The String(describing:) initializer is the preferred way to convert an instance of any type to a string. If the passed instance conforms to CustomStringConvertible, the String(describing:) initializer and the print(_:) function use the instance’s custom description property. Accessing a type’s description property directly or using CustomStringConvertible as a generic constraint is discouraged.

struct Card: CustomStringConvertible {

    var description: String { return "\(rank) \(suit)"}

    var suit: Suit
    var rank: Rank

    enum Suit: String, CustomStringConvertible {
        var description: String { return self.rawValue }
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
    }

    enum Rank: Int, CustomStringConvertible {
        case jack = 11
        case lady = 12
        case king = 13
        case ace = 14
        var description: String { return "\(self.rawValue)" }
    }
}

let card = Card(suit: .hearts, rank: .king)
//print(card) // 13 ♥️ nice print
