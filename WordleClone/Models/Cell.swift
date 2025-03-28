//
//  Cell.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import SwiftUI

struct Cell {
    var color: Color = .black.opacity(0.125)
    let letter: String
    let isCorrect: Bool
    let isPartOfSolution: Bool
    
    init(letter: String, isCorrect: Bool, isPartOfSolution: Bool) {
        self.letter = letter
        self.isCorrect = isCorrect
        self.isPartOfSolution = isPartOfSolution
    }
    
    mutating func colorize() {
        if isPartOfSolution {
            if isCorrect {
                color = .green
            } else {
                color = .yellow
            }
        } else {
            color = .black.opacity(0.125)
        }
    }
}
