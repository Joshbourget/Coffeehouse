//
//  InputAddressView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/1/24.
//

import Foundation
import SwiftUI
import Combine
import GooglePlaces

struct InputAddressView: View {
    @State private var showingPlacesAutocomplete = false // To control the presentation
    @ObservedObject var placesController: PlacesController

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Coffeehouse")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 171/255, green: 130/255, blue: 78/255))
                    .fontWeight(.bold)
                Text("The Platform For Democracy")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Image("coffeehouse_white_logo")
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
                .sheet(isPresented: $showingPlacesAutocomplete) {
                    PlacesAutocompleteView(placesController: placesController)
                }
                if !placesController.userAddress.isEmpty {
                    HStack {
                        Spacer()
                        Text("Selected Address: \(placesController.userAddress)")
                            .foregroundColor(.black)
                            .padding()
                            .frame(alignment: .center)
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationBarTitle("Address", displayMode: .inline)
        }
    }
}

