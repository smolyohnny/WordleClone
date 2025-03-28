//
//  KeyboardView.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import SwiftUI

struct KeyboardView: View {
    
    @StateObject private var viewModel: KeyboardViewModel
    
    init(gridViewModel: GridViewModel) {
        _viewModel = StateObject(wrappedValue: KeyboardViewModel(gridViewModel: gridViewModel))
    }
    
    private let letterRow1: [String] = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    private let letterRow2: [String] = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    private let letterRow3: [String] = ["Z", "X", "C", "V", "B", "N", "M"]
    
    
    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: 2) {
                ForEach(letterRow1, id: \.self) { letter in
                    Button(action: {
                        viewModel.keyTapped(letter)
                    }) {
                        Text(letter)
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.black.opacity(0.125))
                            .foregroundColor(.black)
                            .cornerRadius(4)
                    }
                }
            }
            HStack(spacing: 2) {
                ForEach(letterRow2, id: \.self) { letter in
                    Button (action: {
                        viewModel.keyTapped(letter)
                    }) {
                        Text(letter)
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.black.opacity(0.125))
                            .foregroundColor(.black)
                            .cornerRadius(4)
                    }
                }
            }
            HStack(spacing: 2) {
                Button(action: {
                    viewModel.removeLetter()
                }) {
                    Text("❌")
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.black.opacity(0.125))
                        .foregroundColor(.black)
                        .cornerRadius(4)
                }
                
                ForEach(letterRow3, id: \.self) { letter in
                    Button(action: {
                        viewModel.keyTapped(letter)
                    }) {
                        Text(letter)
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.black.opacity(0.125))
                            .foregroundColor(.black)
                            .cornerRadius(4)
                    }
                }
                
                Button(action: {
                    viewModel.validate()
                }) {
                    Text("✅")
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.black.opacity(0.125))
                        .foregroundColor(.black)
                        .cornerRadius(4)
                }
            }
        }.safeAreaPadding(.bottom)
    }
}
