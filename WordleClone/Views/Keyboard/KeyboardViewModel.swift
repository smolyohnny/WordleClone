//
//  KeyboardViewModel.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//
import SwiftUI

final class KeyboardViewModel: ObservableObject {
    private var gridViewModel: GridViewModel
    
    init(gridViewModel: GridViewModel) {
        self.gridViewModel = gridViewModel
    }
    
    func keyTapped(_ key: String) {
        gridViewModel.insertLetter(key, at: gridViewModel.currentRow, col: gridViewModel.currentCol)
    }
    
    func validate() {
        gridViewModel.validate()
    }
    
    func removeLetter() {
        gridViewModel.removeLetter()
    }
}
