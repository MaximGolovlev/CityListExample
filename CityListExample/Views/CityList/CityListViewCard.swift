//
//  CityListViewCard.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct CityListViewCard: View {
    let list: CityList
    
    var body: some View {
        VStack {
            Text(list.name)
                .font(.title)
            Text("\(list.cities.count) городов")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(list.color.opacity(0.2))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(list.color, lineWidth: 2)
        )
        .padding()
    }
}
