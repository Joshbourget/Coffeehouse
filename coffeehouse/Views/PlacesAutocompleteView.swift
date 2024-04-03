//
//  PlacesAutocompleteView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation
import SwiftUI
import GooglePlaces

struct PlacesAutocompleteView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placesController: PlacesController
    
    func makeCoordinator() -> PlacesAutocompleteCoordinator {
            PlacesAutocompleteCoordinator(self, placesController: placesController)
        }
        
    class PlacesAutocompleteCoordinator: NSObject, GMSAutocompleteViewControllerDelegate {
        var parent: PlacesAutocompleteView
        var placesController: PlacesController

        init(_ parent: PlacesAutocompleteView, placesController: PlacesController) {
            self.parent = parent
            self.placesController = placesController
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            // Here we update the userAddress in placesController
            placesController.updateAddress(place.formattedAddress ?? "Unknown Address")
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            // Handle the error.
            print("Error: \(error.localizedDescription)")
            parent.presentationMode.wrappedValue.dismiss()
        }

        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            // Handle cancellation.
            parent.presentationMode.wrappedValue.dismiss()
        }

        // Handle other delegate methods...
    }

    func makeUIViewController(context: Context) -> GMSAutocompleteViewController {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = context.coordinator

        let fields: GMSPlaceField = [.name, .placeID, .formattedAddress]
        autocompleteController.placeFields = fields

        return autocompleteController
    }

    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: Context) { }
}

