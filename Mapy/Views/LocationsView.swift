//
//  LocationsView.swift
//  Mapy
//
//  Created by Mert Durkaya on 29/02/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
