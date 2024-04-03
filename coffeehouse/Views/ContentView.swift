//
//  ContentView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/1/24.
//

import Foundation
import SwiftUI
import Combine
import GooglePlaces

struct ContentView: View {
    @StateObject var placesController = PlacesController()

    var body: some View {
        
        TabView {
            InputAddressView(placesController: placesController)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            BallotView(placesController: placesController)
                .tabItem {
                    Image(systemName: "person.2.circle.fill")
                }
            MyVotingListView(placesController: placesController)
                .tabItem {
                    Image(systemName: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
