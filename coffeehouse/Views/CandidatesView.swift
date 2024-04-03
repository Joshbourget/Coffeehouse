//
//  CandidatesView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation
import SwiftUI

struct CandidatesView: View {
    @ObservedObject var placesController: PlacesController
    @State private var navigateToProfile = false

    var body: some View {
        List {
            ForEach(Array(placesController.candidatesByOffice.keys.sorted()), id: \.self) { office in
                Section(header: Text(office)) {
                    ForEach(placesController.candidatesByOffice[office]!.indices, id: \.self) { index in
                        let candidate = placesController.candidatesByOffice[office]![index]
                        Button(action: {
                            placesController.selectCandidate(candidate: candidate)
                            self.navigateToProfile = true
                        }) {
                            Text("\(candidate.name)")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        NavigationLink(destination: CandidateProfileView(placesController: placesController), isActive: $navigateToProfile) {
            EmptyView()
        }
    }
}

