//
//  CandidateModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation

struct CandidateModel: Decodable, Identifiable, Equatable {
    let name: String
    let office: String
    var id: String {
        return "\(name)"
    }
}

