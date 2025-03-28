//
//  GridView.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import SwiftUI

struct GridView: View {
    @StateObject private var gridViewModel: GridViewModel
    
    init(gridViewModel: GridViewModel) {
        _gridViewModel = StateObject(wrappedValue: gridViewModel)
    }
    
    var body: some View {
        VStack {
            ForEach(0..<gridViewModel.totalRows, id: \.self) { row in
                HStack {
                    ForEach(0..<gridViewModel.totalCols, id: \.self) { col in
                        Text(gridViewModel.gridArray[row][col].letter)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: 60, height: 60)
                            .background(gridViewModel.gridArray[row][col].color)
                            .cornerRadius(5)
                    }
                }
            }
        }.overlay {
            gridViewModel.didWin ? CustomAlertView(message: "YOU WON!", onDismiss: {gridViewModel.reset() }): nil
            gridViewModel.isGameOver ? CustomAlertView(message: "YOU LOST!", onDismiss: { gridViewModel.reset() }): nil
        }
    }
}
