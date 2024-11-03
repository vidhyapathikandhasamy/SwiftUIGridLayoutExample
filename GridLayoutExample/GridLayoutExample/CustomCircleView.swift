//
//  CustomCircleView.swift
//  GridLayoutExample
//
//  Created by Vidhyapathi on 23/10/24.
//

import SwiftUI

struct CustomCircleView: View {
    var frameSize: CGFloat = 100
    var circleColor: Color = .blue
    var strokeColor: Color = .yellow
    
    
    var body: some View {
        Circle()
            .frame(width: frameSize, height: frameSize)
            .foregroundColor(circleColor)
            .overlay(Circle().stroke(strokeColor, lineWidth: 4))
            .padding()
    }
}

#Preview {
    CustomCircleView()
}
