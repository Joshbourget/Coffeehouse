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

    func makeUIViewController(context: Context) -> GMSAutocompleteViewController {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = context.coordinator

        let fields: GMSPlaceField = [.name, .placeID]
        autocompleteController.placeFields = fields

        return autocompleteController
    }

    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, placesController: placesController)
    }

    class Coordinator: NSObject, GMSAutocompleteViewControllerDelegate {
        var parent: PlacesAutocompleteView
        var placesController: PlacesController

        init(_ parent: PlacesAutocompleteView, placesController: PlacesController) {
            self.parent = parent
            self.placesController = placesController
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            placesController.selectPlace(name: place.name ?? "Unknown", placeID: place.placeID ?? "Unknown", address: place.formattedAddress ?? "Unknown")
            parent.presentationMode.wrappedValue.dismiss()
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            print("Error: ", error.localizedDescription)
        }

        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

