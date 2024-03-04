//
//  LocationsDetailView.swift
//  Mapy
//
//  Created by Mert Durkaya on 03/03/2024.
//

import SwiftUI
import MapKit

struct LocationsDetailView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 8)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
            .ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(alignment: .topTrailing) {
                backButton
            }
    }
}

#Preview {
    LocationsDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationsDetailView {
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .tabViewStyle(.page)
        .frame(height: 500)
    }
    
    private var titleSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack {
                Button {
                    viewModel.openWithAppleMaps(location: location)
                } label: {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more", destination: url)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top, 8)
            }
            
        }
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 16)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(32)
    }
    
    private var backButton: some View {
        Button {
            withAnimation {
                viewModel.sheetLocation = nil
            }
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .clipShape(Circle())
                .padding()
        }
    }
}
