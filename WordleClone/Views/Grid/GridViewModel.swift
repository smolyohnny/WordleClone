//
//  GridViewModel.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import Foundation

final class GridViewModel: ObservableObject {
    
    private let grid = Grid()
    private let wordList: WordList = WordList()
    let totalRows: Int
    let totalCols: Int
    let defaultCell: Cell
    
    @Published var targetWord: String
    @Published var gridArray: [[Cell]]
    
    @Published var currentCol: Int = 0
    @Published var currentRow: Int = 0
    @Published var isGameOver: Bool = false
    @Published var didWin: Bool = false
    
    init() {
        targetWord = wordList.getRandomWord()
        totalRows = grid.rowCount
        totalCols = grid.columnCount
        defaultCell = Cell(letter: " ", isCorrect: false , isPartOfSolution: false)
        gridArray = Array(repeating: Array(repeating: defaultCell, count: totalCols), count: totalRows)
        updateCurrentCell()
    }
    
    func insertLetter(_ letter: String, at row: Int, col: Int) {
        var isCorrect: Bool = false
        var isPartOfSolution: Bool = false
        if targetWord.contains(letter) {
            isPartOfSolution = true
            
            if targetWord[targetWord.index(targetWord.startIndex, offsetBy: col)] == Character(letter) {
                isCorrect = true
            }
        }
        gridArray[row][col] = Cell(letter: letter, isCorrect: isCorrect,isPartOfSolution: isPartOfSolution)
        
        if currentCol < totalCols-1 {
            currentCol += 1
        }
        if currentCol < totalCols {
            updateCurrentCell()
        }
        
    }
    
    func removeLetter() {
        if currentCol > 0 {
            if gridArray[currentRow][currentCol].letter != " " {
                gridArray[currentRow][currentCol] = defaultCell
            } else {
                currentCol -= 1
                gridArray[currentRow][currentCol] = defaultCell
            }
        } else {
            return
        }
        updateCurrentCell()
    }
    
    func validate() {
        var emptyCount = 0
        var correctCount = 0

        for index in 0..<totalCols {
            if gridArray[currentRow][index].letter == " " {
                emptyCount += 1
            }
        }

        if emptyCount > 0 { return }

        for index in 0..<totalCols {
            gridArray[currentRow][index].colorize()
            if gridArray[currentRow][index].isCorrect {
                correctCount += 1
            }
        }

        if correctCount == totalCols {
            didWin = true
        } else if currentRow < totalRows - 1 {
            currentCol = 0
            currentRow += 1
        } else {
            isGameOver = true
        }

        if !didWin && !isGameOver {
            updateCurrentCell()
        }
    }
    
    func updateCurrentCell() {
        if currentCol < totalCols-1 {
            gridArray[currentRow][currentCol+1].color = defaultCell.color
        } else if currentCol > 0 {
            gridArray[currentRow][currentCol-1].color = defaultCell.color
        }
        gridArray[currentRow][currentCol].color = .black.opacity(0.25)
    }
    
    func reset() {
        isGameOver = false
        currentRow = 0
        currentCol = 0
        for row in 0..<totalRows {
            for col in 0..<totalCols {
                gridArray[row][col] = defaultCell
            }
        }
        updateCurrentCell()
    }
}
