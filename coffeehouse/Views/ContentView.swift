//
//  ContentView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/25/24.
//

import SwiftUI
import Combine
import GooglePlaces

struct ContentView: View {
    
    var body: some View {
        TabView {
            InputAddressView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            BallotView()
                .tabItem {
                    Image(systemName: "person.2.circle.fill")
                }
            MyVotingListView()
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
