//
//  AddCityListButton.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct AddCityListButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5]))
                )
                .padding()
        }
        .buttonStyle(.plain)
    }
}
