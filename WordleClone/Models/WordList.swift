//
//  WordList.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import Foundation

final class WordList {
    private let words: [String] = [
        "APPLE", "BRICK", "CHAIR", "DREAM", "FLUTE",
        "GRAPE", "HORSE", "JUDGE", "KNIFE", "LIGHT",
        "MONEY", "NORTH", "OCEAN", "PLANT", "RIVER",
        "SNAKE", "TABLE", "UNION", "VIOLET", "WHEEL",
        "XENON", "YEAST", "ZEBRA"
    ]
    
    func getRandomWord() -> String {
        words.randomElement() ?? "APPLE"
    }
}
