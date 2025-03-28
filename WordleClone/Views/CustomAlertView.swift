//
//  CustomAlertView.swift
//  WordleClone
//
//  Created by Jan Hamza on 28.03.2025.
//

import SwiftUI

struct CustomAlertView: View {
    let message: String
    let onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.title)
                .fontWeight(.bold)
            
            Button(action: {
                onDismiss()
            }) {
                Text("PLAY AGAIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 40)
                    .background(Color.black.opacity(0.250))
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(width: 250)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
