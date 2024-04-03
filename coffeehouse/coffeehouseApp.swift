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
        UITabBar.appearance().backgroundColor = UIColor(Color(red: 171/255, green: 130/255, blue: 78/255))
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(.black)
        }
    }
}
