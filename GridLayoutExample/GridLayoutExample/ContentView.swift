//
//  ContentView.swift
//  GridLayoutExample
//
//  Created by Vidhyapathi on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    @State private var gridColumn: Double = 3.0
    
    @State private var mainGridColor: Color = .red
    
    @State private var gridInfo: [Color] = [.red, .blue, .yellow, .indigo, .green, .pink, .purple, .orange, .black, .gray, .cyan, .brown]
    
    func updateGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                CustomCircleView(frameSize: 200, circleColor: mainGridColor, strokeColor: .white)
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn) { oldValue, newValue in
                        updateGridLayout()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 5) {
                    ForEach(0..<gridInfo.count, id: \.self) { index in
                        CustomCircleView(frameSize: 92, circleColor: gridInfo[index], strokeColor: Color.white)
                            .onTapGesture {
                                mainGridColor = gridInfo[index]
                            }
                    }
                }
                .onAppear {
                    updateGridLayout()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
