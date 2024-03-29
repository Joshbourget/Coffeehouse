//
//  coffeehouseApp.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/25/24.
//

import SwiftUI
import GooglePlaces


@main
struct coffeehouseApp: App {
    init() {
        GMSPlacesClient.provideAPIKey("AIzaSyB2dvD2i9kDxLwFHMBDNrPBQUWL32OKDF8")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
