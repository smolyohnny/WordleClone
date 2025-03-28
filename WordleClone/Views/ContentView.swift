//
//  ContentView.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var gridViewModel = GridViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            GridView(gridViewModel: gridViewModel)
            Spacer()
            KeyboardView(gridViewModel: gridViewModel)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
