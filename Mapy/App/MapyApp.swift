//
//  MapyApp.swift
//  Mapy
//
//  Created by Mert Durkaya on 29/02/2024.
//

import SwiftUI

@main
struct MapyApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
