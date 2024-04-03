//
//  CandidateProfileView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation
import SwiftUI

struct CandidateProfileView: View {
    @ObservedObject var placesController: PlacesController
    var candidate: CandidateModel?
    
    var body: some View {
        VStack {
            if let candidate = placesController.selectedCandidate {
                Text(candidate.name)
                    .font(.title)
                    .foregroundColor(.black)
                Button(action: {
                    if let candidate = placesController.selectedCandidate {
                        self.placesController.addToVotingList(candidate: candidate)
                    }
                }) {
                    Text("Add to Voting List")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .cornerRadius(10)
                }
                Button(action: {
                    if let candidate = placesController.selectedCandidate {
                        self.placesController.removeFromVotingList(candidate: candidate)
                    }
                }) {
                    Text("Remove From Voting List")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .cornerRadius(10)
                }
            } else {
                Text("Select a Candidate")
                    .font(.title)
            }
        }
        .padding()
    }
}
