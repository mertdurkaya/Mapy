//
//  LocationMapAnnotationView.swift
//  Mapy
//
//  Created by Mert Durkaya on 03/03/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor: Color = .accentColor
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .font(.headline)
                .foregroundColor(.white)
                .padding(4)
                .background(accentColor)
                .cornerRadius(32)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
