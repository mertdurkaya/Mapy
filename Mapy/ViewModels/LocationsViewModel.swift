//
//  LocationsViewModel.swift
//  Mapy
//
//  Created by Mert Durkaya on 01/03/2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
