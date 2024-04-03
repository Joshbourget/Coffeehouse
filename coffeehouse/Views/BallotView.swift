//
//  BallotView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation
import SwiftUI

struct BallotView: View {
    @ObservedObject var placesController: PlacesController
  
    // State to manage navigation
    @State private var navigateToCandidates = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.navigateToCandidates = true
                        }) {
                            VStack {
                                if !placesController.electionDate.isEmpty {
                                    Text("Election Date: \(placesController.electionDate)")
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                if !placesController.locationAddress.isEmpty {
                                    Text("Location Address: \(placesController.locationAddress)")
                                        .foregroundColor(.white)
                                        .frame(width: 300)
                                        .padding()
                                }
                            }
                            .padding()
                            .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                            .cornerRadius(40)
                        }
                        .padding()
                        .shadow(radius: 5)
                        Spacer()
                    }
                Spacer()
                NavigationLink(destination: CandidatesView(placesController: placesController), isActive: $navigateToCandidates) {
                    EmptyView()
                }
            }
            .navigationBarTitle("My Ballots", displayMode: .inline)
        }
    }
}


    
