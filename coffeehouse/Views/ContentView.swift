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
    @State private var showingPlacesAutocomplete = false // To control the presentation
    @StateObject var placesController = PlacesController()
    @State private var navigateToDetails = false // To control navigation
    @State private var userAddress: String = "" // To store the input address
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Coffeehouse")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 171/255, green: 130/255, blue: 78/255))
                    .fontWeight(.bold)
                Text("The Platform For Democracy")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Image("coffeehouse_back_logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                Button(action: {
                            showingPlacesAutocomplete = true
                        }) {
                            Text("Input Address")
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                                .cornerRadius(10)
                        }
                        .padding()
                        .onReceive(placesController.$selectedPlace) { selectedPlace in
                            self.userAddress = selectedPlace?.address ?? "No address selected"
                            }
                NavigationLink(destination: BallotView()) {
                                Text("Go to Ballots")
                                .foregroundColor(.white)
                                .underline()
                }
                Spacer()
                }
                .frame(maxWidth: .infinity) // Expands to fill the width
                .background(Color.black) // Example background color
                .edgesIgnoringSafeArea(.all)
                Spacer()
        }
        // Present the Google Places Autocomplete when the button is tapped
        .sheet(isPresented: $showingPlacesAutocomplete) {
            PlacesAutocompleteView(placesController: placesController)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
