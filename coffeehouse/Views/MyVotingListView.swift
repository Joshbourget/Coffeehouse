//
//  MyVotingListView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation
import SwiftUI

struct MyVotingListView: View {
    @ObservedObject var placesController: PlacesController

    var body: some View {
        VStack {
            Text("My Voting List")
                .font(.largeTitle)
                .foregroundColor(Color(red: 171/255, green: 130/255, blue: 78/255))
                .fontWeight(.bold)
            List {
                ForEach(placesController.votingList) { candidate in
                    VStack(alignment: .leading) {
                        Text(candidate.name)
                            .font(.headline)
                    }
                }
            }
        }
        .navigationTitle("My Voting List")
    }
}
