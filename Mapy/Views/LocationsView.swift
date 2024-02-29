//
//  LocationsView.swift
//  Mapy
//
//  Created by Mert Durkaya on 29/02/2024.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Text(location.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
