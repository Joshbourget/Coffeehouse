//
//  ElectionModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation
import Vapor

final class ElectionModel: Content {
    var id: UUID?
    var name: String
    var date: Date
    var location: String
    var candidates: [Candidate]
    
    init(id: UUID? = nil, name: String, date: Date, location: String, candidates: [Candidate]) {
        self.id = id
        self.name = name
        self.date = date
        self.location = location
        self.candidates = candidates
    }
}

final class CandidateModel: Content {
    var name: String
    var party: String
    
    init(name: String, party: String) {
        self.name = name
        self.party = party
    }
}
