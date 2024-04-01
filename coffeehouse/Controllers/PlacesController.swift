//
//  PlacesController.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/27/24.
//

import Foundation

class PlacesController: ObservableObject {
    @Published var coordinates: String = ""
    @Published var userAddress: String = ""
    
    func updateAddress(_ address: String) {
            self.userAddress = address
    }
    
    func fetchCoordinates(for address: String) {
        guard let url = URL(string: "http://localhost:8080/geocode") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = ["address": address]
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(CoordinatesResponse.self, from: data) {
                DispatchQueue.main.async {
                    self?.coordinates = "Latitude: \(decodedResponse.latitude), Longitude: \(decodedResponse.longitude)"
                }
            }
        }.resume()
    }
    
    struct CoordinatesResponse: Decodable {
        let latitude: Double
        let longitude: Double
    }
}
