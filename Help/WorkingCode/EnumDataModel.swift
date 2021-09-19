//
//  EnumDataModel.swift
//  Help
//
//  Created by Sergey Lukaschuk on 19.09.2021.
//

import Foundation

enum Difficulty: String {
    typealias DifficultyContent = (title: String, description: String, levels: Int)
    
    case novice
    case warrior
    case master
    case unknown
    
    var content: DifficultyContent {
        switch self {
        case .novice:
            return (title: "Novice", description: "All Too Easy!", levels: 8)
        case .warrior:
            return (title: "Warrior", description: "You Will Die Mortal!", levels: 10)
        case .master:
            return (title: "Master", description: "You Will Never Win!", levels: 12)
        case .unknown:
            return (title: "Unknown", description: "Unknown!", levels: -1)
        }
    }
}

func showTower(for difficulty: Difficulty) {
    print(difficulty.content.title)
    print(difficulty.content.description)
    print(difficulty.content.levels)
}

let difficulty = Difficulty(rawValue: "novice")

// showTower(for: difficulty ?? .unknown)



