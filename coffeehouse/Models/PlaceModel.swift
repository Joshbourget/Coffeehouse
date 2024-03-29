//
//  PlaceModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/27/24.
//

import Foundation
import GooglePlaces

struct PlaceModel {
    var name: String
    var placeID: String
    var address: String?
}

func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    // Assuming you're storing the result in a Place struct
    let selectedPlace = PlaceModel(name: place.name ?? "Unknown",
                              placeID: place.placeID ?? "Unknown",
                              address: place.formattedAddress) // Use formattedAddress for the address
    // Update your model/UI accordingly
}
