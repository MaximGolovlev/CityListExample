//
//  Untitled.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct SnapCarousel<Content: View>: View {
    let itemCount: Int
    let itemWidth: CGFloat
    let spacing: CGFloat
    @Binding var selectedIndex: Int?
    let content: (Int) -> Content
    
    private var edgePadding: CGFloat {
        (UIScreen.main.bounds.width - itemWidth) / 2
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(0..<itemCount, id: \.self) { index in
                        content(index)
                            .frame(width: itemWidth)
                            .scaleEffect(selectedIndex == index ? 1.0 : 0.8)
                            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedIndex)
                            .id(index)
                    }
                }
                .padding(.horizontal, edgePadding)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: Binding<Int?>(
                get: { selectedIndex },
                set: { newValue in
                    if let newValue = newValue, newValue < itemCount - 1 {
                        selectedIndex = newValue
                    }
                }
            ))
            .onAppear {
                if let selectedIndex = selectedIndex {
                    scrollProxy.scrollTo(selectedIndex, anchor: .center)
                }
            }
        }
    }
}
