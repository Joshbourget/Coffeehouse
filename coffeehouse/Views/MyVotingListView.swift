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
        NavigationView {
            VStack {
                List {
                    ForEach(Array(placesController.candidatesGroupedByOffice.keys.sorted()), id: \.self) { office in
                        Section(header: Text(office)) {
                            ForEach(placesController.candidatesGroupedByOffice[office] ?? []) { candidate in
                                VStack(alignment: .leading) {
                                    Text(candidate.name)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("My Voting List", displayMode: .inline)
        }
    }
}
