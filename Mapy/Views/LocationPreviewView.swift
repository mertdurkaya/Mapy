//
//  LocationPreviewView.swift
//  Mapy
//
//  Created by Mert Durkaya on 02/03/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 16.0) {
                learnMoreButton
                nextButton
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial)
            .offset(y: 65))
        .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.orange.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding(8)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .clipped()
            }
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)

    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 128, height: 32)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonTapped()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 128, height: 32)
        })
        .buttonStyle(.bordered)
    }
}
