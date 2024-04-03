//
//  PlacesController.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation
import Combine

class PlacesController: ObservableObject {
    @Published var userAddress: String = ""
    @Published var electionDate: String = "No address selected"
    @Published var locationAddress: String = "No address selected"
    @Published var candidatesByOffice: [String: [CandidateModel]] = [:]
    @Published var votingList: [CandidateModel] = []
    @Published var selectedCandidate: CandidateModel? = nil

    // Updates the user's address and fetches upcoming ballot information
    func updateAddress(_ address: String) {
        self.userAddress = address
        fetchBallotInfo()
    }
    
    func fetchBallotInfo() {
        guard let url = URL(string: "http://localhost:3000/fetchBallots") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = ["address": userAddress]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching ballot information: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(BallotResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.electionDate = response.electionDate
                    self?.locationAddress = response.locationAddress
                    self?.candidatesByOffice = response.candidatesByOffice
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func addToVotingList(candidate: CandidateModel) {
        votingList.append(candidate)
    }
    
    func selectCandidate(candidate: CandidateModel) {
        DispatchQueue.main.async {
            self.selectedCandidate = candidate
        }
    }
    
    struct BallotResponse: Decodable {
        let electionDate: String
        let locationAddress: String
        let candidatesByOffice: [String: [CandidateModel]]
    }
}
