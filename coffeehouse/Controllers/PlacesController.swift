//
//  PlacesController.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/27/24.
//

import Foundation

class PlacesController: ObservableObject {
    @Published var selectedPlace: PlaceModel?
    // Or if managing multiple places
    @Published var places: [PlaceModel] = []
    
    func selectPlace(name: String, placeID: String, address: String) {
        // Example of setting a selected place with address
        let newPlace = PlaceModel(name: name, placeID: placeID, address: address)
        self.selectedPlace = newPlace
    }
}
