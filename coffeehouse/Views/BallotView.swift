//
//  BallotView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation
import SwiftUI

struct BallotView: View {
    let pollingPlace = BallotModel(id: "1", date: "2024-11-04", location: "123 Coffeehouse Lane, Brewtown", candidates: [
        CandidateModel(id: "c1", name: "John Doe", pfpURL: "url", websiteURL: "url", office: "President"),
        CandidateModel(id: "c2", name: "Jane Doe", pfpURL: "url", websiteURL: "url", office: "Vice President")
        // Add more candidates as needed
    ], offices: "President, Vice President")

    // State to manage navigation
    @State private var navigateToCandidates = false

    var body: some View {
        VStack {
            Spacer()
            // The button
            Text("Upcoming Elections")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        self.navigateToCandidates = true
                    }) {
                        VStack {
                            Text(pollingPlace.date)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(pollingPlace.location)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 60)
                        .padding()
                        .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .cornerRadius(40)
                    }
                    .padding()
                    .shadow(radius: 5)
                    
                    Button(action: {
                        self.navigateToCandidates = true
                    }) {
                        VStack {
                            Text(pollingPlace.date)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(pollingPlace.location)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 60)
                        .padding()
                        .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .cornerRadius(40)
                    }
                    .padding()
                    .shadow(radius: 5)
                    
                    Button(action: {
                        self.navigateToCandidates = true
                    }) {
                        VStack {
                            Text(pollingPlace.date)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(pollingPlace.location)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 60)
                        .padding()
                        .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .cornerRadius(40)
                    }
                    .padding()
                    .shadow(radius: 5)
                }
            }
            Spacer()
            NavigationLink(destination: CandidatesView(candidates: pollingPlace.candidates), isActive: $navigateToCandidates) {
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity) // Expands to fill the width
        .background(Color.black) // Example background color
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("My Ballots", displayMode: .inline)
    }
}

    
