//
//  CandidateProfileView.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/30/24.
//

import Foundation
import SwiftUI

struct CandidateProfileView: View {
    var candidate: CandidateModel
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                // Placeholder for candidate's profile picture
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray) // Use AsyncImage or similar to load from URL
                
                Text(candidate.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                if let url = URL(string: candidate.websiteURL), UIApplication.shared.canOpenURL(url) {
                    Link("Campaign Website", destination: url)
                        .padding(.top, 10)
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity) // Expands to fill the width
        .navigationBarTitle("Candidate Profile", displayMode: .inline)
    }
}

