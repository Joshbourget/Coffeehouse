//
//  CandidateModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 4/2/24.
//

import Foundation

struct CandidateModel: Decodable, Identifiable {
    let name: String
    var id: String {
        return "\(name)"
    }
}

