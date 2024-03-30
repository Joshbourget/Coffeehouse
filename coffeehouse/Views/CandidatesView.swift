//
//  CandidatesView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/30/24.
//

import Foundation
import SwiftUI

struct CandidatesView: View {
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

// Dummy view for candidate photo
struct CandidatePhotoView: View {
    var pfpURL: String

    var body: some View {
        // Placeholder for an image
        // In a real app, you would download the image from pfpURL or use a cached version
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
            // Replace with actual image fetching logic
    }
}


