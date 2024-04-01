//
//  MyVotingListView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/1/24.
//

import Foundation
import SwiftUI

struct MyVotingListView: View {
    var candidates = [
        CandidateModel(id: "1", name: "John Doe", pfpURL: "url1", websiteURL: "website1", office: "President"),
        CandidateModel(id: "2", name: "Jane Doe", pfpURL: "url2", websiteURL: "website2", office: "Vice President")]

    // Organize candidates by office
    private var candidatesByOffice: [String: [CandidateModel]] {
        Dictionary(grouping: candidates, by: { $0.office })
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("My Voting List")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 171/255, green: 130/255, blue: 78/255))
                        .fontWeight(.bold)
                    Spacer()
                }
                
                ForEach(candidatesByOffice.keys.sorted(), id: \.self) { office in
                    Text(office)
                        .font(.headline)
                        .padding(.top)
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(candidatesByOffice[office] ?? [], id: \.id) { candidate in
                                NavigationLink(destination: CandidateProfileView(candidate: candidate)) {
                                        CandidatePhotoView(pfpURL: candidate.pfpURL)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.black) // Example background color
        .navigationBarTitle("Candidates", displayMode: .inline)
    }
}

